//
//  ShopCollectionViewCell.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    var shopCD : ShopCD?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    func refresh(shopCD: ShopCD) {
        self.shopCD  = shopCD
        
        // Se informan los campos de la celda
        self.labelView.text = shopCD.name
        
        if let data = shopCD.logoData {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_image")
        }
        
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 25
        }
    }
}
