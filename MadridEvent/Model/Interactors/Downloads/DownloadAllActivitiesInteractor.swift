//
//  DownloadAllActivitiesInteractor.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

protocol DownloadAllActivitiesInteractor {
    // execute: downloads all activities. Return on the main thread
    func execute(onSuccess: @escaping activitiesClosure, onError: errorClosure)
    func execute(onSuccess: @escaping activitiesClosure)
}
