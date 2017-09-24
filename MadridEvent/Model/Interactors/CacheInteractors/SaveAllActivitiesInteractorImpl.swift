//
//  SaveAllActivitiesInteractorImpl.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 24/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

class SaveAllActivitiesInteractorImpl: SaveAllActivitiesInteractor {
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping activitiesClosure, onError: errorClosure) {
        
        for indexFor in 0 ..< activities.count() {
            let activity = activities.get(index: indexFor)
            
            let _ = mapActivityIntoActivityCD(context: context, activity: activity)
        }
        
        do {
            try context.save()
            onSuccess(activities)
        } catch {
            //            Código de error a devolver
            //            onError(nil)
        }
        
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping activitiesClosure) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
}
