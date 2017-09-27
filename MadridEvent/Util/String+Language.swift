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
    
    if deviceLanguage() == spanishLanguage {
        textReturn = shopCD.openingHoursEs ?? ""
    } else if deviceLanguage() == englishLanguage {
        textReturn = shopCD.openingHoursEn ?? ""
    }
    return textReturn
}


func translateDescription(shopCD: ShopCD) -> String {
    var textReturn: String = ""
    
    if deviceLanguage() == spanishLanguage {
        textReturn = shopCD.descriptionEs ?? ""
    } else if deviceLanguage() == englishLanguage {
        textReturn = shopCD.descriptionEn ?? ""
    }
    return textReturn
}

// MARK: - Translate Errors
func displayError(textError: String) -> String {
    var textReturn: String = ""
    
    switch textError {
    case CacheError:
        if deviceLanguage() == spanishLanguage {
            textReturn =  "💩 Error al realizar cache"
        } else if deviceLanguage() == englishLanguage {
            textReturn =  "💩 Failed to perform cache"
        }
    case ConnectionError:
        if deviceLanguage() == spanishLanguage {
            textReturn =  "💩 Error al conectarse a Internet"
        } else if deviceLanguage() == englishLanguage {
            textReturn =  "💩 Failed to connect to the Internet"
        }
    case CacheImageError:
        if deviceLanguage() == spanishLanguage {
            textReturn =  "💩 Error al descargar la imagen"
        } else if deviceLanguage() == englishLanguage {
            textReturn =  "💩 Error downloading image"
        }
    case JSONParseError:
        if deviceLanguage() == spanishLanguage {
            textReturn =  "💩 Error al transformar datos"
        } else if deviceLanguage() == englishLanguage {
            textReturn =  "💩 Error transforming data"
        }
    default:
        textReturn = "Error no controlado: " + textError
    }
    return textReturn
}


