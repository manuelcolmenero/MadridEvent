//
//  MapActivities.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

func mapActivityCDIntoActivity (activityCD : ActivityCD) -> Activity {
    // Mapping ActivityCD into Activity
    let activity                = Activity(name: activityCD.name ?? "Empty")
    activity.address            = activityCD.address ?? ""
    activity.image              = activityCD.imageURL ?? ""
    activity.logo               = activityCD.logoURL ?? ""
    
    activity.latitude           = activityCD.latitude
    activity.longitude          = activityCD.longitude
    activity.openingHoursEn     = activityCD.openingHoursEn ?? ""
    activity.openingHoursEs     = activityCD.openingHoursEs ?? ""
    
    activity.descriptionEn       = activityCD.descriptionEn ?? ""
    activity.descriptionEs       = activityCD.descriptionEs ?? ""
    
    return activity
}

func mapActivityIntoActivityCD (context: NSManagedObjectContext, activity: Activity) -> ActivityCD {
    
    // Mapping Activity into ActivityCD
    let activityCD              = ActivityCD(context: context)
    activityCD.name             = activity.name
    activityCD.address          = activity.address
    activityCD.imageURL         = activity.image
    activityCD.logoURL          = activity.logo
    
    activityCD.latitude         = activity.latitude ?? 0
    activityCD.longitude        = activity.longitude ?? 0
    
    activityCD.openingHoursEn   = activity.openingHoursEn
    activityCD.openingHoursEs   = activity.openingHoursEs
    activityCD.descriptionEn    = activity.descriptionEn
    activityCD.descriptionEs    = activity.descriptionEs
    
    let serialQueue = DispatchQueue(label: "DownloadImageQueue")
    serialQueue.sync {
        activityCD.logoData  = downloadAndCacheImage(urlString: activity.logo)
        activityCD.imageData = downloadAndCacheImage(urlString: activity.image)
        
        let urlString = mapAPI + "\(activity.latitude!),\(activity.longitude!)"
        activityCD.locationData = downloadAndCacheImage(urlString: urlString)
    }
    return activityCD
}
