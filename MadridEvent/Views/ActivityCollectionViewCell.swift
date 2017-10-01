//
//  ActivityCollectionViewCell.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 28/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

// Clase destinada a mostrar los datos de Activity en la CollectionView de listado
class ActivityCollectionViewCell: UICollectionViewCell {
    
    // Declaración de variables
    var activityCD : ActivityCD?
    
    // Declaración de objetos del listado
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    // Función para mostrar los datos en la celda
    func refresh(activityCD: ActivityCD) {
        
        // Se obtienen los datos a mostrar
        self.activityCD  = activityCD
        
        // Se informan los campos de la celda
        self.labelView.text = activityCD.name
        
        // Se verifican que existen las imagenes.
        // De no ser así se muestra una por defecto indicando su ausencia
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
        
        // Modificación de la imagen para que tenga los bordes redondeados
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 25
        }
    }
}
