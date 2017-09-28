//
//  UserPopUp.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 27/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit


func userPopUp(title: String, message: String, vc: UIViewController, onCompletion: @escaping () -> Void) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    
    vc.present(alert, animated: true, completion: {
        onCompletion()
    })
}
