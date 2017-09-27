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
        
        downloadShopsInteractor.execute (onSuccess: { (shops: Shops) in
            
            // Cuando se termina de obtener de internet las shops se guardan en local
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context!, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImp().execute()
                
            }, onError: {
                print(displayError(textError: CacheError))
            })
        }, onError: {
            userPopUp(title: "Error", message: displayError(textError: ConnectionError), vc: self, onCompletion: {
                // una vez pulsa el boton de OK
            })
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc     = segue.destination as! ShopsListViewController
            vc.context = self.context
        } 
    }
}
