//
//  ActivitiesListViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ActivitiesListViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    
    @IBOutlet weak var mapActivityView: MKMapView!
    @IBOutlet weak var collectionActivityView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
