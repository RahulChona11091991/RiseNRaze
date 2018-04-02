//
//  RiseNRazeViewController+CollectionViewDelegates.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation
import UIKit

extension RiseNRazeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FutureGenerationManager.sharedManager().row
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FutureGenerationManager.sharedManager().column
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RRConstants.CollectionViewConstants.lifeCellConstant, for: indexPath) as! LifeCollectionViewCell
        cell.configureCell(life: RRConstants.LifeStatus(rawValue: world[indexPath.section][indexPath.row]) ?? RRConstants.LifeStatus.Dead)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if world[indexPath.section][indexPath.row] == RRConstants.LifeStatus.Alive.rawValue {
            world[indexPath.section][indexPath.row] = RRConstants.LifeStatus.Dead.rawValue
        } else {
            world[indexPath.section][indexPath.row] = RRConstants.LifeStatus.Alive.rawValue
        }
        
        print("Next Generation")
        world = FutureGenerationManager.sharedManager().nextGeneration(presentWorld: world)
        FutureGenerationManager.sharedManager().printWorldGrid(world: world)
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width/CGFloat(FutureGenerationManager.sharedManager().column))
        let height = (collectionView.frame.size.height/CGFloat(FutureGenerationManager.sharedManager().row))
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
            //here you can do the logic for the cell size if phone is in landscape
        } else {
            //logic if not landscape
        }
        
        flowLayout.invalidateLayout()
    }
}
