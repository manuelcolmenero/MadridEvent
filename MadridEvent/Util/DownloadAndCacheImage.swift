//
//  DownloadAndCacheImage.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 25/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

func downloadAndCacheImage(urlString: String) -> Data {
    
    var data = Data()
    
    if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let myUrl = URL(string: url) {
        do {
            data = try Data(contentsOf: myUrl)
            return data
        } catch {
            print("💩 Error al crear la UIImage con URL: " + url)
        }
    }
    return data
}
