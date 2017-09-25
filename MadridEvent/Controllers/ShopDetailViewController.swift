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
        self.shopDetailDescription.text = self.shopCD.descriptionEs
        
        if let data = shopCD.imageData {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_image")
        }
        
    }
    
}
