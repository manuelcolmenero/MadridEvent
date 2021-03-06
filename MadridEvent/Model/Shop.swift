//
//  Shop.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

public class Shop {
    var name           : String
    var descriptionEn  : String   = ""
    var descriptionEs  : String   = ""
    var latitude       : Float?   = nil
    var longitude      : Float?   = nil
    var image          : String   = ""
    var logo           : String   = ""
    var openingHoursEn : String   = ""
    var openingHoursEs : String   = ""
    var address        : String   = ""
    
    public init(name: String) {
        self.name = name
    }
    
    
}
