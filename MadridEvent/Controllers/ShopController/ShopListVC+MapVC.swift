//
//  ShopListVC+MapVC.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 26/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData


extension ShopsListViewController: CLLocationManagerDelegate, MKMapViewDelegate {
 
    func mapViewDidFinishRenderingMap (_ mapView: MKMapView, fullyRendered: Bool) {
        if let shopsCD = shopFetchedResultsController(context: self.context).fetchedObjects {
            for shopCD in shopsCD {
                
                // Crear anotaciones y añadiendo al mapa
                createAnnotation(shopCD: shopCD)
                
            }
        }
    }
    
    func createAnnotation(shopCD: ShopCD) {
        let shopLocation = CLLocation(latitude: CLLocationDegrees(shopCD.latitude),
                                      longitude: CLLocationDegrees(shopCD.longitude))
        
        let subtitle: String = translateOpeningHours(shopCD: shopCD)
        
        let annotation = Annotation(coordinate: shopLocation.coordinate,
                                    title: shopCD.name,
                                    subtitle: subtitle,
                                    shopCD: shopCD)
        
        self.mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Si la anotación es el punto del usuario no hacemos nada.
        if annotation is MKUserLocation {
            return nil
        }
        
        // Se crea un identificador para el pin
        let pinID = "shopPin"
        
        // Se pide que le asigne una anotación al pin
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: pinID)
        
        // Si no hay una anotación reutilizable se crea una
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinID)
            
            // Se activa que muestre el pin cuando se hace click sobre ella
            pinView?.canShowCallout = true
            
            // Se crea una anotación con la tienda seleccionada
            let shopCD = (annotation as! Annotation).getShopCD()
            
            // Se informa la imagen de la tienda
            let image: UIImage
            if let logo = shopCD.logoData {
                image = UIImage(data: logo)!
            } else {
                image = #imageLiteral(resourceName: "no_image")
            }

            let rigthButton = UIButton(type: .detailDisclosure)
            let leftButton = UIImageView(image: image)
            leftButton.frame.size.height = 44
            leftButton.frame.size.width = 44

            pinView?.rightCalloutAccessoryView = rigthButton
            pinView?.leftCalloutAccessoryView = leftButton
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    // Se recoge el evento que se ejecuta cuando se pulsa sobre uno de los pines
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // Se obtienen los datos de la anotación y se invoca al detalle
        if let annotation = view.annotation as? Annotation {
            let shopCD = annotation.getShopCD()
            performSegue(withIdentifier: "ShowShopDetailSegue", sender: shopCD)
        }
        
    }
}
