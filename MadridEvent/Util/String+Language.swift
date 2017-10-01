//
//  String+Language.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 27/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation


// MARK: - Translate Shops
func translateOpeningHours(shopCD: ShopCD) -> String {
    var textReturn: String = ""
    
    if deviceLanguage() == SPANISHLANGUAGE {
        textReturn = shopCD.openingHoursEs ?? ""
    } else if deviceLanguage() == ENGLISHLANGUAGE {
        textReturn = shopCD.openingHoursEn ?? ""
    }
    return textReturn
}


func translateDescription(shopCD: ShopCD) -> String {
    var textReturn: String = ""
    
    if deviceLanguage() == SPANISHLANGUAGE {
        textReturn = shopCD.descriptionEs ?? ""
    } else if deviceLanguage() == ENGLISHLANGUAGE {
        textReturn = shopCD.descriptionEn ?? ""
    }
    return textReturn
}

// MARK: - Translate Activity
func translateOpeningHours(activityCD: ActivityCD) -> String {
    var textReturn: String = ""
    
    if deviceLanguage() == SPANISHLANGUAGE {
        textReturn = activityCD.openingHoursEs ?? ""
    } else if deviceLanguage() == ENGLISHLANGUAGE {
        textReturn = activityCD.openingHoursEn ?? ""
    }
    return textReturn
}


func translateDescription(activityCD: ActivityCD) -> String {
    var textReturn: String = ""
    
    if deviceLanguage() == SPANISHLANGUAGE {
        textReturn = activityCD.descriptionEs ?? ""
    } else if deviceLanguage() == ENGLISHLANGUAGE {
        textReturn = activityCD.descriptionEn ?? ""
    }
    return textReturn
}

// MARK: - Translate texts
func displayText(text: String) -> String {
    var textReturn: String = ""
    
    switch text {
    case LOADTEXT:
        if deviceLanguage() == SPANISHLANGUAGE {
            textReturn =  SPLOADINGTEXT
        } else if deviceLanguage() == ENGLISHLANGUAGE {
            textReturn =  ENLOADINGTEXT
        }
    default:
        textReturn = "Texto no controlado: " + text
    }
    return textReturn
}

// MARK: - Translate Errors
func displayError(textError: String) -> String {
    var textReturn: String = ""
    
    switch textError {
    case CACHEERROR:
        if deviceLanguage() == SPANISHLANGUAGE {
            textReturn =  "💩 Error al realizar cache"
        } else if deviceLanguage() == ENGLISHLANGUAGE {
            textReturn =  "💩 Failed to perform cache"
        }
    case CONNECTIONERROR:
        if deviceLanguage() == SPANISHLANGUAGE {
            textReturn =  "💩 Error al conectarse a Internet"
        } else if deviceLanguage() == ENGLISHLANGUAGE {
            textReturn =  "💩 Failed to connect to the Internet"
        }
    case CACHEIMAGEERROR:
        if deviceLanguage() == SPANISHLANGUAGE {
            textReturn =  "💩 Error al descargar la imagen "
        } else if deviceLanguage() == ENGLISHLANGUAGE {
            textReturn =  "💩 Error downloading image "
        }
    case JSONPARSEERROR:
        if deviceLanguage() == SPANISHLANGUAGE {
            textReturn =  "💩 Error al transformar datos"
        } else if deviceLanguage() == ENGLISHLANGUAGE {
            textReturn =  "💩 Error transforming data"
        }
    default:
        textReturn = "Error no controlado: " + textError
    }
    return textReturn
}



