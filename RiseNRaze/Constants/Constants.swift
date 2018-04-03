//
//  Constants.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 12/01/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation

struct RRConstants {
    
    //MARK: - CONSTANTS -
    enum StoryBoardIdentifier:String {
        case KMain = "Main"
    }
    
    enum ViewControllerIdentifiers:String {
        case KRiseNRazeViewControllerIdentifier  = "RiseNRazeViewControllerID"
        case KConfigureWorldViewControllerIdentifier  = "ConfigureWorldViewControllerID"
    }
    
    enum LifeStatus:Int {
        case Dead = 0
        case Alive = 1
    }
    
    enum NumberOfLivesBound:Int {
        case Lower = 2
        case Upper = 10
    }
    
    struct CollectionViewConstants {
        static let lifeCellConstant = "LifeCollectionViewCell"
    }

}
