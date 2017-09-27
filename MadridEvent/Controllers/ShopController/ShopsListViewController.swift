//
//  ShopsListViewController.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 17/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ShopsListViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.delegate = self
        self.mapView.delegate = self
        
        self.collectionView.dataSource = self
        self.collectionView.delegate   = self

        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.mapView.showsUserLocation = true
        
        let madridLocation = CLLocation(latitude:  40.416775, longitude: -3.703790)
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span:
            MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.mapView.setRegion(madridRegion, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop : ShopCD = shopFetchedResultsController(context: context).object(at: indexPath)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            let shopCD : ShopCD = sender as! ShopCD
            
            // se le añade
            vc.shopCD = shopCD
        }
    }
}

