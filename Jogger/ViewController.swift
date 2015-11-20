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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    }
    
    var managedObjectContext: NSManagedObjectContext?
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(NewRunViewController) {
            if let newRunViewController = segue.destinationViewController as? NewRunViewController {
                newRunViewController.managedObjectContext = managedObjectContext
            }
        }
    }
}