//
//  Route.swift
//  Jogger
//
//  Created by Stephen Rice on 11/23/15.
//  Copyright © 2015 Stephen Rice. All rights reserved.
//

import Foundation
import MapKit

class RouteLocation {
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

var route = [CLLocation(latitude: CLLocationDegrees(41.635753), longitude: CLLocationDegrees(-86.232251)),
             CLLocation(latitude: CLLocationDegrees(41.635852), longitude: CLLocationDegrees(-86.232182)),
             CLLocation(latitude: CLLocationDegrees(41.636119), longitude: CLLocationDegrees(-86.231308)),
             CLLocation(latitude: CLLocationDegrees(41.636451), longitude: CLLocationDegrees(-86.231082)),
             CLLocation(latitude: CLLocationDegrees(41.636566), longitude: CLLocationDegrees(-86.233384)),
             CLLocation(latitude: CLLocationDegrees(41.635425), longitude: CLLocationDegrees(-86.233379)),
             CLLocation(latitude: CLLocationDegrees(41.635026), longitude: CLLocationDegrees(-86.233154)),
    CLLocation(latitude: CLLocationDegrees(41.634834), longitude: CLLocationDegrees(-86.232515)),
    CLLocation(latitude: CLLocationDegrees(41.634942), longitude: CLLocationDegrees(-86.232008)),
    CLLocation(latitude: CLLocationDegrees(41.635499), longitude: CLLocationDegrees( -86.229915)),
    CLLocation(latitude: CLLocationDegrees(41.635646), longitude: CLLocationDegrees(-86.229154)),
    CLLocation(latitude: CLLocationDegrees(41.635967), longitude: CLLocationDegrees(-86.228934)),
    //the following are San Francisco traffic lights near the Castro
    // data taken from https://data.sfgov.org/Transportation/Traffic-Control-Signal-Locations-in-San-Francisco-/knrw-a3gi (shapefile format) and google maps coordinates
    /*CLLocation(latitude: CLLocationDegrees(37.767958), longitude: CLLocationDegrees(-122.428851)),
    CLLocation(latitude: CLLocationDegrees(37.76449), longitude: CLLocationDegrees(-122.428722)),
    CLLocation(latitude: CLLocationDegrees(37.764244), longitude: CLLocationDegrees(-122.433089)),
    CLLocation(latitude: CLLocationDegrees(37.764795), longitude: CLLocationDegrees(-122.424195)),
    CLLocation(latitude: CLLocationDegrees(37.764676), longitude: CLLocationDegrees( -122.426448)),
    CLLocation(latitude: CLLocationDegrees( 37.770817), longitude: CLLocationDegrees(-122.424903)),*/
]
