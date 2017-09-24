//
//  ActivityCollectionViewCell.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    var activity : Activity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    func refresh(activity: Activity) {
        self.activity  = activity
        
        // Se informan los campos de la celda
        self.labelView.text = activity.name
        self.activity?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 25
        }
    }
}