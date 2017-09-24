//
//  MainViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExecutedOnceInteractorImpl().execute {
            initializeData()
        }
    }
    
    func initializeData() {
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            
            // Cuando se termina de obtener de internet las shops se guardan en local
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context!, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImp().execute()
            })
        }
    }
    
    // MARK: - Fetched shop results controller
    
    var _fetchedShopResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    var fetchedShopResultsController: NSFetchedResultsController<ShopCD> {
        
        // Lazy hace lo mismo que preguntar si ya existe y en caso de ser cierto lo devuelve
        if _fetchedShopResultsController != nil {
            return _fetchedShopResultsController!
        }
        
        // NSFetchRequest es el equivalente a SELECT *
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        _fetchedShopResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopCacheFile")
        
        do {
            // Se ejecuta la consulta
            try _fetchedShopResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedShopResultsController!
    }
    
    // MARK: - Fetched activity results controller
    
    var _fetchedActivityResultsController: NSFetchedResultsController<ActivityCD>? = nil
    
    var fetchedActivityResultsController: NSFetchedResultsController<ActivityCD> {
        
        // Lazy hace lo mismo que preguntar si ya existe y en caso de ser cierto lo devuelve
        if _fetchedActivityResultsController != nil {
            return _fetchedActivityResultsController!
        }
        
        // NSFetchRequest es el equivalente a SELECT *
        let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        _fetchedActivityResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ActivityCacheFile")
        
        do {
            // Se ejecuta la consulta
            try _fetchedActivityResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedActivityResultsController!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc     = segue.destination as! ShopsListViewController
            vc.context = self.context
        } else if segue.identifier == "ShowActivitiesSegue" {
            let vc     = segue.destination as! ActivitiesListViewController
            vc.context = self.context
        }
    }
    
    
}
