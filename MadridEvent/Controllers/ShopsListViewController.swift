//
//  ShopsListViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 17/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class ShopsListViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

