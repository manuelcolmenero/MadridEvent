//
//  Constants.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 26/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// CONSTANTES

// URLs
public let URLMAPAPI       = "https://maps.googleapis.com/maps/api/staticmap?%25&size=320x220&scale=2&markers="
public let URLACTIVITYAPI  = "https://madrid-shops.com/json_new/getActivities.php"
public let URLSHOPAPI      = "https://madrid-shops.com/json_new/getShops.php"

// Language
public let SPANISHLANGUAGE  = "ES"
public let ENGLISHLANGUAGE  = "EN"

public let LOADTEXT         = "LOAD"
public let SPLOADINGTEXT    = "Cargando..."
public let ENLOADINGTEXT    = "Loading..."

// Errors
public let CACHEERROR       = "ERRORCACHE"
public let CONNECTIONERROR  = "ERRORCONNECTION"
public let CACHEIMAGEERROR  = "ERRORCACHEIMAGE"
public let JSONPARSEERROR   = "ERRORJSONPARSE"


// LITERALES

// BBDD
public let APLICATIONNAME       = "MadridEvent"

// IDCells
public let ACTIVITYCELL         = "ActivityCell"
public let SHOPCELL             = "ShopCell"

// Segue
public let ACTIVITYLISTSEGUE    = "ShowActivitiesSegue"
public let ACTIVITYDETAILSEGUE  = "ShowActivityDetailSegue"
public let SHOPLISTSEGUE        = "ShowShopsSegue"
public let SHOPDETAILSEGUE      = "ShowShopDetailSegue"

// DispatchQueue
public let DOWNLOADIMAGEQUEUE   = "DownloadImageQueue"

// FetchedResults
public let ACTIVITYCACHEFILE    = "ActivityCacheFile"
public let ACTIVITYSORTDESC     = "name"

public let SHOPCACHEFILE        = "ShopCacheFile"
public let SHOPSORTDESC         = "name"
