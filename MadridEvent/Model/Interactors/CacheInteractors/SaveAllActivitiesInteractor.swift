//
//  SaveAllActivitiesInteractor.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllActivitiesInteractor {
    // execute: all activities. Return on the main thread
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping activitiesClosure, onError: errorClosure)
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping activitiesClosure)
}
