//
//  ActivityListVC+CollectionVC.swift
//  MadridEvent
//
//  Created by Manuel Colmenero Navarro on 28/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData

extension ActivitiesListViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return activityFetchedResultsController(context: context).sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = activityFetchedResultsController(context: context).sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ActivityCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ACTIVITYCELL, for: indexPath) as! ActivityCollectionViewCell

        
        let activityCD : ActivityCD = activityFetchedResultsController(context: context).object(at: indexPath)
        
        cell.refresh(activityCD: activityCD)
        
        return cell
    }
}
