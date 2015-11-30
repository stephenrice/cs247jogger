//
//  NewRunViewController.swift
//  Jogger
//
//  Created by Stephen Rice on 11/16/15.
//  Copyright (c) 2015 Stephen Rice. All rights reserved.
//

import UIKit
import CoreLocation
import HealthKit
import MapKit
import AVFoundation
import AudioToolbox


let DetailSegueName = "RunDetails"

class NewRunViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var seconds = 0
    var distance = 0.0
    var paused = false
    var usedStoplights = [Stoplight]()
    var audioPlayer: AVAudioPlayer?
    
    var soundNotifications = false
    var visualNotifications = false
    var hapticNotifications = false
    let synth = AVSpeechSynthesizer()
    
    lazy var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.activityType = .Fitness
        _locationManager.allowsBackgroundLocationUpdates = true
        _locationManager.distanceFilter = 5.0
        return _locationManager
    }()
    
    lazy var locations = [CLLocation]()
    lazy var timer = NSTimer()

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        startButton.hidden = false

        timeLabel.hidden = true
        distanceLabel.hidden = true
        paceLabel.hidden = true
        stopButton.hidden = false
        
        var coords = [CLLocationCoordinate2D]()
        for location in route {
            coords.append(location.coordinate)
        }
        
        let region = MKCoordinateRegionMakeWithDistance(route.last!.coordinate, 500, 500)
        mapView.setRegion(region, animated: true)
        mapView.addOverlay(MKPolyline(coordinates: &coords, count: coords.count))
        locationManager.requestAlwaysAuthorization()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func eachSecond(timer: NSTimer) {
        if paused {
            return
        }
        seconds++
        var extraZero = ""
        if seconds % 60 < 10 {
            extraZero = "0"
        }
        let timeStr = "" + String(seconds/60) + ":" + extraZero + String(seconds % 60)
        timeLabel.text = timeStr
        
        let milesDistance = 0.000621371 * distance
        distanceLabel.text = String(format: "%.2f", milesDistance)
        
        paceLabel.text = String(format: "%.2f", Double(seconds)/(60*milesDistance))
    }
    
    
    @IBAction func startPressed(sender: AnyObject) {
        if paused {
            paused = false
            startButton.setTitle("Pause", forState: .Normal)
        } else if startButton.titleLabel?.text == "Pause" {
            paused = true
            startButton.setTitle("Resume", forState: .Normal)
        } else {
            timeLabel.hidden = false
            distanceLabel.hidden = false
            paceLabel.hidden = false
            stopButton.alpha = CGFloat(1)
            startButton.setTitle("Pause", forState: .Normal)
            seconds = 0
            distance = 0.0
            locations.removeAll(keepCapacity: false)
            timer = NSTimer.scheduledTimerWithTimeInterval(1,
                target: self,
                selector: "eachSecond:",
                userInfo: nil,
                repeats: true)
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction func stopPressed(sender: AnyObject) {
        let actionSheet = UIActionSheet(title: "Run Stopped", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Use Data to Improve Jogger", "Discard Run Data")
        actionSheet.actionSheetStyle = .Default
        actionSheet.showInView(view)
        startButton.titleLabel?.text = "Start"
        stopButton.alpha = CGFloat(0.5)
        usedStoplights = []
    }
    
}

// MARK: UIActionSheetDelegate
extension NewRunViewController: UIActionSheetDelegate {
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        //save
        if buttonIndex == 1 {
            navigationController?.popToRootViewControllerAnimated(true)
        }
        //discard
        else if buttonIndex == 2 {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension NewRunViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for location in locations {
            let howRecent = location.timestamp.timeIntervalSinceNow
            
            if abs(howRecent) < 10 && location.horizontalAccuracy < 20 {
                //update distance
                if self.locations.count > 0 {
                    distance += location.distanceFromLocation(self.locations.last!)
                    
                    var coords = [CLLocationCoordinate2D]()
                    coords.append(self.locations.last!.coordinate)
                    coords.append(location.coordinate)
                    
                    let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500)
                    mapView.setRegion(region, animated: true)
                    
                    mapView.addOverlay(MKPolyline(coordinates: &coords, count: coords.count))
                }
                
                //save location
                self.locations.append(location)
            }
            for stoplight in stoplights {
                if stoplight.location.distanceFromLocation(location) <= 100 &&
                    !usedStoplights.contains({ (light: Stoplight) -> Bool in
                        if stoplight.location == light.location {
                            return true;
                        }
                        return false
                }) {
                    usedStoplights.append(stoplight)
                    
                    if visualNotifications {
                        // create a corresponding local notification
                        let notification = UILocalNotification()
                        notification.alertBody = stoplight.directionStr // text that will be displayed in the notification
                        print(stoplight.directionStr)
                        //notification.userInfo = ["UUID": item.UUID, ]
                        notification.category = "TODO_CATEGORY"
                        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
                    }
                    
                    if soundNotifications {
                        //let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(stoplight.audioName, ofType: "caf")!)
                        do {
//                            self.audioPlayer = try AVAudioPlayer(contentsOfURL: sound, fileTypeHint: nil)
//                            audioPlayer!.prepareToPlay()
//                            audioPlayer!.play()
                            let audioSpeech = AVSpeechUtterance(string: stoplight.directionStr)
                            audioSpeech.rate = 0.4
                            synth.speakUtterance(audioSpeech)
                        } catch {
                            //nil
                        }
                    }
                    if hapticNotifications {
                        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    }
                    
                }
            }
        }
        
    }
}

// MARK: - MKMapViewDelegate
extension NewRunViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if !overlay.isKindOfClass(MKPolyline) {
            return nil
        }
        
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        if seconds > 0 {
            renderer.strokeColor = UIColor.blueColor()
            renderer.lineWidth = 5
        } else {
            renderer.strokeColor = UIColor.grayColor()
            renderer.lineWidth = 8
        }
        
        return renderer
    }
}