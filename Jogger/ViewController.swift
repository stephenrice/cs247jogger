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
    
    
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var visualButton: UIButton!
    @IBOutlet weak var hapticButton: UIButton!
    
    @IBAction func onAudio(sender: AnyObject) {
        if audio {
            audio = false
            audioButton.alpha = CGFloat(0.4)
        } else {
            audio = true
            audioButton.alpha = CGFloat(1)
        }
    }
    

    @IBAction func onHaptic(sender: AnyObject) {
        if haptic {
            haptic = false
            hapticButton.alpha = CGFloat(0.4)
        } else {
            haptic = true
            hapticButton.alpha = CGFloat(1)
        }
    }
    
    @IBAction func onVisual(sender: AnyObject) {
        if visual {
            visual = false
            visualButton.alpha = CGFloat(0.4)
        } else {
            visual = true
            visualButton.alpha = CGFloat(1)
        }
    }
    
    
    var audio = false
    var visual = false
    var haptic = false
    
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