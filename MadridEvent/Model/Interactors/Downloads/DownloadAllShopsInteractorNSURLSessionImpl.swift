//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping shopsClosure, onError: errorClosure) {
        
        let urlString =  URLSHOPAPI
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task    = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    
                    if error == nil {
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
                        
                    } else {
                        // Se ha localizado un error
                        if let myError = onError {
                            myError()
                        }
                    }
                }
            }
            task.resume()
        } else {
            // Se ha localizado un error
            if let myError = onError {
                myError()
            }
        }
    }
    
    func execute(onSuccess: @escaping shopsClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}
