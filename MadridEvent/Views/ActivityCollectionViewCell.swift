//
//  ActivityCollectionViewCell.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 28/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    var activityCD : ActivityCD?
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    func refresh(activityCD: ActivityCD) {
        self.activityCD  = activityCD
        
        // Se informan los campos de la celda
        self.labelView.text = activityCD.name
        
        if let data = activityCD.logoData {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_image")
        }
        
        if let imageData = activityCD.imageData {
            self.contentView.backgroundColor = UIColor(patternImage: UIImage(data: imageData)!)
        } else {
            self.contentView.backgroundColor = UIColor.lightGray
        }
        
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 25
        }
    }
}
