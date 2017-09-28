//
//  ActivityDetailViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 28/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    // shop siempre tendrá valor
    var activityCD : ActivityCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityDetailDescription: UITextView!
    @IBOutlet weak var addressView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.activityCD.name
        self.activityDetailDescription.text = translateDescription(activityCD: activityCD)
        self.addressView.text = self.activityCD.address
        
        if let mapData = activityCD.locationData {
            self.imageView.image = UIImage(data: mapData)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_map")
        }
    }
}
