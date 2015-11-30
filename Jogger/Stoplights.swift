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
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.636451), longitude: CLLocationDegrees(-86.231082)),
        direction: "Turn left", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635026), longitude: CLLocationDegrees(-86.233154)),
        direction: "Turn left on derp street", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635499), longitude: CLLocationDegrees( -86.229915)),
        direction: "Turn right on merp street", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635646), longitude: CLLocationDegrees(-86.229154)),
        direction: "Turn right on herp street", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635967), longitude: CLLocationDegrees(-86.228934)),
        direction: "Turn right on perp street", audio: "test_turnright"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(41.635852), longitude: CLLocationDegrees(-86.232182)),
        direction: "Turn right on zerp street", audio: "test_turnright"),
    /*Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330222), longitude: CLLocationDegrees(-122.023243)),
        direction: "Turn left"),
    Stoplight(loc: CLLocation(latitude: CLLocationDegrees(37.330222), longitude: CLLocationDegrees(-122.023243)),
        direction: "Turn left"),*/
]