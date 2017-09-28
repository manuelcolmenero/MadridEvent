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
    
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityView.isHidden = true
        self.loadingLabelView.isHidden = true
        
        ExecutedOnceInteractorImpl().execute {
            initializeData()
        }
    }
    
    func initializeData() {
        
        self.activityButton.isEnabled   = false
        self.shopButton.isEnabled       = false
        self.loadingLabelView.isHidden  = false
        self.activityView.isHidden      = false
        self.activityView.startAnimating()
        
        self.loadingLabelView.text = displayText(text: LoadingText)
        
        
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        let downloadActivitiesInteractor : DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        
        downloadShopsInteractor.execute (onSuccess: { (shops: Shops) in
            
            // Cuando se termina de obtener de internet las shops se guardan en local
            let shopsCacheInteractor = SaveAllShopsInteractorImpl()
            shopsCacheInteractor.execute(shops: shops, context: self.context!, onSuccess: { (shops: Shops) in
                
                downloadActivitiesInteractor.execute (onSuccess: { (activities: Activities) in
                    
                    // Cuando se termina de obtener de internet las activities se guardan en local
                    let activityCacheInteractor = SaveAllActivitiesInteractorImpl()
                    activityCacheInteractor.execute(activities: activities, context: self.context!, onSuccess: { (activities: Activities) in
                        
                        SetExecutedOnceInteractorImp().execute()
                        
                        self.activityView.stopAnimating()
                        self.activityView.isHidden     = true
                        self.loadingLabelView.isHidden = true
                        self.activityButton.isEnabled  = true
                        self.shopButton.isEnabled      = true
                    }, onError: {
                        print(displayError(textError: CacheError))
                        self.activityView.stopAnimating()
                        self.activityView.isHidden     = true
                        self.loadingLabelView.isHidden = true
                        self.activityButton.isEnabled  = true
                        self.shopButton.isEnabled      = true
                    })
                }, onError: {
                    userPopUp(title: "Error", message: displayError(textError: ConnectionError), vc: self, onCompletion: {
                        self.activityView.stopAnimating()
                        self.activityView.isHidden     = true
                        self.loadingLabelView.isHidden = true
                        self.activityButton.isEnabled  = true
                        self.shopButton.isEnabled      = true
                    })
                })
            }, onError: {
                print(displayError(textError: CacheError))
                self.activityView.stopAnimating()
                self.activityView.isHidden     = true
                self.loadingLabelView.isHidden = true
                self.activityButton.isEnabled  = true
                self.shopButton.isEnabled      = true
            })
        }, onError: {
            userPopUp(title: "Error", message: displayError(textError: ConnectionError), vc: self, onCompletion: {
                self.activityView.stopAnimating()
                self.activityView.isHidden     = true
                self.loadingLabelView.isHidden = true
                self.activityButton.isEnabled  = true
                self.shopButton.isEnabled      = true
            })
        })
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
