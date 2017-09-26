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

func deviceLanguage() -> DeviceLanguageTypes {
    
    let language = Locale.current.languageCode
    
    return language == "en" ? DeviceLanguageTypes.En : DeviceLanguageTypes.Es
}
