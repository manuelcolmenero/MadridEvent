//
//  ActivityListVC+MapVC.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 28/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation
import CoreData


extension ActivitiesListViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func mapViewDidFinishRenderingMap (_ mapView: MKMapView, fullyRendered: Bool) {
        if let activitiesCD = activityFetchedResultsController(context: self.context).fetchedObjects {
            for activityCD in activitiesCD {
                
                // Crear anotaciones y añadiendo al mapa
                createAnnotation(activityCD: activityCD)
                
            }
        }
    }
    
    func createAnnotation(activityCD: ActivityCD) {
        let activityLocation = CLLocation(latitude: CLLocationDegrees(activityCD.latitude),
                                      longitude: CLLocationDegrees(activityCD.longitude))
        
        let subtitle: String = translateOpeningHours(activityCD: activityCD)
        
        let annotation = AnnotationActivity(coordinate: activityLocation.coordinate,
                                    title: activityCD.name,
                                    subtitle: subtitle,
                                    activityCD: activityCD)
        
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
            
            // Se activa que muestre el pin cuando se pulsa
            pinView?.canShowCallout = true
            
            // Se crea una anotación con el registro seleccionada
            let activityCD = (annotation as! AnnotationActivity).getActivityCD()
            
            // Se informa la imagen
            let image: UIImage
            if let logo = activityCD.logoData {
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
        if let annotation = view.annotation as? AnnotationActivity {
            let activityCD = annotation.getActivityCD()
            performSegue(withIdentifier: "ShowActivityDetailSegue", sender: activityCD)
        }
        
    }
}
