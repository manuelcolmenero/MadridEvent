//
//  SaveAllShopsInteractorImpl.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

class SaveAllShopsInteractorImpl: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure, onError: errorClosure) {
        
        for indexFor in 0 ..< shops.count() {
            let shop = shops.get(index: indexFor)
            
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            if let myError = onError {
                myError()
            }           
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
}
