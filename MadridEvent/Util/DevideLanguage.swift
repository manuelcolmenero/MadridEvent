//
//  DevideLanguage.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 26/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

public enum DeviceLanguageTypes {
    case En
    case Es
}

func deviceLanguage() -> String {
    
    let language = Locale.current.languageCode
    
    switch language {
    case "en"?:
        return englishLanguage
    case "es"?:
        return spanishLanguage
    default:
        return spanishLanguage
    }
}
