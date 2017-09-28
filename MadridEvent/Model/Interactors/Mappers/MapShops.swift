//
//  MapShops.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

func mapShopCDIntoShop (shopCD : ShopCD) -> Shop {
    // Mapping ShopCD into Shop
    let shop                  = Shop(name: shopCD.name ?? "Empty")
    shop.address              = shopCD.address  ?? ""
    shop.image                = shopCD.imageURL ?? ""
    shop.logo                 = shopCD.logoURL  ?? ""
    
    shop.latitude             = shopCD.latitude
    shop.longitude            = shopCD.longitude
    shop.openingHoursEn       = shopCD.openingHoursEn ?? ""
    shop.openingHoursEs       = shopCD.openingHoursEs ?? ""
    
    shop.descriptionEn        = shopCD.descriptionEn ?? ""
    shop.descriptionEs        = shopCD.descriptionEs ?? ""
    
    
    
    return shop
}

func mapShopIntoShopCD (context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    
    // Mapping shop into ShopCD
    let shopCD              = ShopCD(context: context)
    shopCD.name             = shop.name
    shopCD.address          = shop.address
    shopCD.imageURL         = shop.image
    shopCD.logoURL          = shop.logo
    
    shopCD.latitude         = shop.latitude ?? 0
    shopCD.longitude        = shop.longitude ?? 0
    
    shopCD.openingHoursEn   = shop.openingHoursEn
    shopCD.openingHoursEs   = shop.openingHoursEs
    shopCD.descriptionEn    = shop.descriptionEn
    shopCD.descriptionEs    = shop.descriptionEs
    
    let serialQueue = DispatchQueue(label: "DownloadImageQueue")
    serialQueue.sync {
        shopCD.logoData  = downloadAndCacheImage(urlString: shop.logo)
        shopCD.imageData = downloadAndCacheImage(urlString: shop.image)
        
        let urlString = mapAPI + "\(shop.latitude!),\(shop.longitude!)"
        shopCD.locationData = downloadAndCacheImage(urlString: urlString)
    }
    
    return shopCD
}
