//
//  Stoplights.swift
//  Jogger
//
//  Created by Stephen Rice on 11/17/15.
//  Copyright (c) 2015 Stephen Rice. All rights reserved.
//

import Foundation
import MapKit

class Stoplight {
    var location: CLLocation!
    var directionStr = "Turn right"
    var audioName = "test_turnright"
    var UUID_str = "" //unique ID str
    
    init(loc:CLLocation, direction:String, audio:String) {
        self.location = loc
        self.directionStr = direction
        self.audioName = audio
    }
}

var stoplights = [
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330553), longitude: CLLocationDegrees(-122.030565)),
        direction: "In 100 meters, turn left on Mariani Drive", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330527), longitude: CLLocationDegrees(-122.028944)),
        direction: "In 100 meters, continue onto Apple Running Path", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330263), longitude: CLLocationDegrees(-122.028022)),
        direction: "Continue onto Meritt Street", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.329843), longitude: CLLocationDegrees(-122.019736)),
        direction: "Turn right on Portal Ave", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635499), longitude: CLLocationDegrees( -86.229915)),
        direction: "Turn right on Wheaton Ave", audio: "test_turnright"),
//    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635852), longitude: CLLocationDegrees(-86.232182)),
//        direction: "Turn right on zerp street", audio: "test_turnright"),
    /*Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330222), longitude: CLLocationDegrees(-122.023243)),
        direction: "Turn left"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330222), longitude: CLLocationDegrees(-122.023243)),
        direction: "Turn left"),*/
]