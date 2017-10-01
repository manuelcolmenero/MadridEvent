//
//  DevideLanguage.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 26/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Enum para controlar los idiomas posibles de la aplicación
public enum DeviceLanguageTypes {
    case En
    case Es
}

// Función que obtiene el idioma del dispositivo y devuelve el idioma en una constante
func deviceLanguage() -> String {
    
    let language = Locale.current.languageCode
    
    switch language {
    case "en"?:
        return ENGLISHLANGUAGE
    case "es"?:
        return SPANISHLANGUAGE
    default:
        return SPANISHLANGUAGE
    }
}
