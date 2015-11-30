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

var route = [CLLocation(latitude: CLLocationDegrees(37.331730), longitude: CLLocationDegrees(-122.030795)),
             CLLocation(latitude: CLLocationDegrees(37.331167), longitude: CLLocationDegrees(-122.030801)),
             CLLocation(latitude: CLLocationDegrees(37.330553), longitude: CLLocationDegrees(-122.030565)), //
             CLLocation(latitude: CLLocationDegrees(37.330527), longitude: CLLocationDegrees(-122.028944)),
             CLLocation(latitude: CLLocationDegrees(37.330263), longitude: CLLocationDegrees(-122.028022)),
             CLLocation(latitude: CLLocationDegrees(37.330271), longitude: CLLocationDegrees(-122.023312)),
             //CLLocation(latitude: CLLocationDegrees(37.331841), longitude: CLLocationDegrees(-122.023247)),
             CLLocation(latitude: CLLocationDegrees(37.329843), longitude: CLLocationDegrees(-122.019736)),
             CLLocation(latitude: CLLocationDegrees(37.324498), longitude: CLLocationDegrees(-122.019693)),
             CLLocation(latitude: CLLocationDegrees(37.324515), longitude: CLLocationDegrees(-122.019768)), //wheaton
             CLLocation(latitude: CLLocationDegrees(37.324583), longitude: CLLocationDegrees(-122.025122)), //carol lee dr, right
             CLLocation(latitude: CLLocationDegrees(37.325812), longitude: CLLocationDegrees(-122.025229)), //left Chavoya Dr
    CLLocation(latitude: CLLocationDegrees(37.325829), longitude: CLLocationDegrees(-122.026098)), //right on randy lane
    CLLocation(latitude: CLLocationDegrees(37.326554), longitude: CLLocationDegrees(-122.026173)), //left on forest ave
    CLLocation(latitude: CLLocationDegrees(37.326605), longitude: CLLocationDegrees(-122.026742)), // rihgt on Vista Dr
    CLLocation(latitude: CLLocationDegrees(37.330240), longitude: CLLocationDegrees(-122.026731)), // left on Meritt Dr
    //the following are San Francisco traffic lights near the Castro
    // data taken from https://data.sfgov.org/Transportation/Traffic-Control-Signal-Locations-in-San-Francisco-/knrw-a3gi (shapefile format) and google maps coordinates
    /*CLLocation(latitude: CLLocationDegrees(37.767958), longitude: CLLocationDegrees(-122.428851)),
    CLLocation(latitude: CLLocationDegrees(37.76449), longitude: CLLocationDegrees(-122.428722)),
    CLLocation(latitude: CLLocationDegrees(37.764244), longitude: CLLocationDegrees(-122.433089)),
    CLLocation(latitude: CLLocationDegrees(37.764795), longitude: CLLocationDegrees(-122.424195)),
    CLLocation(latitude: CLLocationDegrees(37.764676), longitude: CLLocationDegrees( -122.426448)),
    CLLocation(latitude: CLLocationDegrees( 37.770817), longitude: CLLocationDegrees(-122.424903)),*/
]
