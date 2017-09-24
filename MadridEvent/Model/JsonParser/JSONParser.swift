//
//  JSONParser.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

func parseShops (data: Data) -> Shops {
    let shops = Shops()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments ) as! Dictionary<String, Any>
        
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop            = Shop(name: shopJson["name"]! as! String)
            shop.address        = shopJson["address"]          as! String
            shop.descriptionEn  = shopJson["description_en"]   as! String
            shop.descriptionEs  = shopJson["description_es"]   as! String
            shop.latitude       = shopJson["gps_lat"]          as? Float
            shop.longitude      = shopJson["gps_lon"]          as? Float
            shop.image          = shopJson["img"]              as! String
            shop.logo           = shopJson["logo_img"]         as! String
            shop.openingHoursEn = shopJson["opening_hours_en"] as! String
            shop.openingHoursEs = shopJson["opening_hours_es"] as! String
            
            shops.add(shop: shop)
        }
    } catch {
        // Muestreo del error
    }
    return shops
}

func parseActivities (data: Data) -> Activities {
    let activities = Activities()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments ) as! Dictionary<String, Any>
        
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for activityJson in result {
            let activity            = Activity(name: activityJson["name"]! as! String)
            activity.address        = activityJson["address"]              as! String
            activity.descriptionEn  = activityJson["description_en"]       as! String
            activity.descriptionEs  = activityJson["description_es"]       as! String
            activity.latitude       = activityJson["gps_lat"]              as? Float
            activity.longitude      = activityJson["gps_lon"]              as? Float
            activity.image          = activityJson["img"]                  as! String
            activity.logo           = activityJson["logo_img"]             as! String
            activity.openingHoursEn = activityJson["opening_hours_en"]     as! String
            activity.openingHoursEs = activityJson["opening_hours_es"]     as! String
            
            activities.add(activity: activity)
        }
    } catch {
        // Muestreo del error
    }
    return activities
}
