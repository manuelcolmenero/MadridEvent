//
//  MainViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData
import SystemConfiguration

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
        
        self.initInterfaceCache()
        self.executeCache()
    }
    
    func initializeData() {
        
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
                        self.finishInterfaceCache()
                        
                    }, onError: {
                        print(displayError(textError: CACHEERROR))
                        self.finishInterfaceCache()
                    })
                }, onError: {
                    userPopUp(title: "Error", message: displayError(textError: CONNECTIONERROR), vc: self, onCompletion: {
                        self.finishInterfaceCache()
                        
                    })
                })
            }, onError: {
                print(displayError(textError: CACHEERROR))
                self.finishInterfaceCache()
                
            })
        }, onError: {
            userPopUp(title: "Error", message: displayError(textError: CONNECTIONERROR), vc: self, onCompletion: {
                self.finishInterfaceCache()
                
            })
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOPLISTSEGUE {
            let vc     = segue.destination as! ShopsListViewController
            vc.context = self.context
        } else if segue.identifier == ACTIVITYLISTSEGUE {
            let vc     = segue.destination as! ActivitiesListViewController
            vc.context = self.context
        }
    }
    
    // Función de inicializar la pantalla Main para empezar la descarga de datos a cache
    func initInterfaceCache() {
        
        self.activityButton.isEnabled   = false
        self.shopButton.isEnabled       = false
        self.loadingLabelView.isHidden  = false
        self.activityView.isHidden      = false
        self.activityView.startAnimating()
        
        self.loadingLabelView.text = displayText(text: LOADTEXT)
        
    }
    
    // Función de inicializar la pantalla Main para terminar la descarga de datos a cache
    func finishInterfaceCache() {
        self.activityView.stopAnimating()
        self.activityView.isHidden     = true
        self.loadingLabelView.isHidden = true
        self.activityButton.isEnabled  = true
        self.shopButton.isEnabled      = true
    }
    
    func executeCache() {
        if isConnectedToNetwork() {
            ExecutedOnceInteractorImpl().execute {
                initializeData()
            }
        } else {
            userPopUp(title: "Error", message: displayError(textError: CONNECTIONERROR), vc: self, onCompletion: {
                self.finishInterfaceCache()
            })
        }
    }
    
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
        
    }
}
