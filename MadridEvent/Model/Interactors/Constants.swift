//
//  Constants.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 26/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// URLs
public let mapAPI      = "https://maps.googleapis.com/maps/api/staticmap?%25&size=320x220&scale=2&markers="
public let activityAPI = "https://madrid-shops.com/json_new/getActivities.php"
public let shopAPI     = "https://madrid-shops.com/json_new/getShops.php"

// Language
public let spanishLanguage = "ES"
public let englishLanguage = "EN"

public let LoadingText    = "LOADING"

// Errors
public let CacheError      = "ERRORCACHE"
public let ConnectionError = "ERRORCONNECTION"
public let CacheImageError = "ERRORCACHEIMAGE"
public let JSONParseError  = "ERRORJSONPARSE"
