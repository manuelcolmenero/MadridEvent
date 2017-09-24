//
//  ExecuteOnceInteractorImpl.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

class ExecutedOnceInteractorImpl: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
            // Ya se habia grabado la variable
        } else {
            // Primera vez que se graba
            closure ()
        }
    }
}
