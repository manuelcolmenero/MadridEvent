//
//  ShopFetchedResultsController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData

// MARK: - Fetched results controller

var _shopFetchedResultsController: NSFetchedResultsController<ShopCD>? = nil


func shopFetchedResultsController(context: NSManagedObjectContext) -> NSFetchedResultsController<ShopCD> {
    
    // Lazy hace lo mismo que preguntar si ya existe y en caso de ser cierto lo devuelve
    if _shopFetchedResultsController != nil {
        return _shopFetchedResultsController!
    }
    
    // NSFetchRequest es el equivalente a SELECT *
    let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
    
    // Set the batch size to a suitable number.
    fetchRequest.fetchBatchSize = 20
    
    // Edit the sort key as appropriate.
    let sortDescriptor = NSSortDescriptor(key: SHOPSORTDESC, ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    
    _shopFetchedResultsController =
        NSFetchedResultsController(fetchRequest: fetchRequest,
                                   managedObjectContext: context,
                                   sectionNameKeyPath: nil,
                                   cacheName: SHOPCACHEFILE)
    
    do {
        // Se ejecuta la consulta
        try _shopFetchedResultsController!.performFetch()
    } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
    
    return _shopFetchedResultsController!
}
