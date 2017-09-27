//
//  ShopDetailViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {
    
    // shop siempre tendrá valor
    var shopCD : ShopCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shopDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shopCD.name
        self.shopDetailDescription.text = translateDescription(shopCD: shopCD)
        
        if let mapData = shopCD.locationData {
            self.imageView.image = UIImage(data: mapData)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_map")
        }
    }
}
