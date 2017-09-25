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
    var shop : Shop!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shopDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shop.name
        self.shopDetailDescription.text = self.shop.descriptionEs
        self.shop.image.loadImage(into: imageView)

    }
    
}
