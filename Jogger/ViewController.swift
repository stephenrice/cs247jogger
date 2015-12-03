//
//  ViewController.swift
//  Jogger
//
//  Created by Stephen Rice on 11/16/15.
//  Copyright (c) 2015 Stephen Rice. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext?
    
    @IBOutlet weak var crowdsButton: UIButton!
    @IBOutlet weak var trafficButton: UIButton!
    @IBOutlet weak var sidewalkButton: UIButton!
    
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var visualButton: UIButton!
    @IBOutlet weak var hapticButton: UIButton!
    
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var milesOrMinLabel: UILabel!
    
    @IBAction func onAudio(sender: AnyObject) {
        if audio {
            audio = false
            audioButton.selected = false
            //audioButton.alpha = CGFloat(1)
        } else {
            audio = true
            audioButton.selected = true
            //audioButton.alpha = CGFloat(1)
        }
    }
    

    @IBAction func onHaptic(sender: AnyObject) {
        if haptic {
            haptic = false
            hapticButton.selected = false
            //hapticButton.alpha = CGFloat(0.4)
        } else {
            haptic = true
            hapticButton.selected = true
            //hapticButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onVisual(sender: AnyObject) {
        if visual {
            visual = false
            visualButton.selected = false
            //visualButton.alpha = CGFloat(0.4)
        } else {
            visual = true
            visualButton.selected = true
            //visualButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onCrowds(sender: AnyObject) {
        if crowds {
            crowds = false
            crowdsButton.selected = false
            //visualButton.alpha = CGFloat(0.4)
        } else {
            crowds = true
            crowdsButton.selected = true
            //visualButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onTraffic(sender: AnyObject) {
        if traffic {
            traffic = false
            trafficButton.selected = false
            //visualButton.alpha = CGFloat(0.4)
        } else {
            traffic = true
            trafficButton.selected = true
            //visualButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onSidewalk(sender: AnyObject) {
        if sidewalk {
            sidewalk = false
            sidewalkButton.selected = false
            //visualButton.alpha = CGFloat(0.4)
        } else {
            sidewalk = true
            sidewalkButton.selected = true
            //visualButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onTime(sender: AnyObject) {
        if !time {
            time = true
            timeButton.selected = true
            distance = false
            distanceButton.selected = false
            milesOrMinLabel.text = "minutes"
        }
    }
    
    @IBAction func onDistance(sender: AnyObject) {
        if !distance {
            distance = true
            distanceButton.selected = true
            time = false
            timeButton.selected = false
            milesOrMinLabel.text = "miles"
        }
    }
    
    var audio = false
    var visual = false
    var haptic = false
    
    var crowds = false
    var traffic = false
    var sidewalk = false
    
    var time = false
    var distance = false
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(NewRunViewController) {
            if let newRunViewController = segue.destinationViewController as? NewRunViewController {
                newRunViewController.soundNotifications = audio
                newRunViewController.visualNotifications = visual
                newRunViewController.hapticNotifications = haptic
            }
        }
    }
}