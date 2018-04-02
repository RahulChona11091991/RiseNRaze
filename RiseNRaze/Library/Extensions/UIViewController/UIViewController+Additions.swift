//
//  UIViewController+Additions.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIVIEWCONTROLLER EXTENSION -
extension UIViewController {

    func presentRiseNRazeViewController() {
        let riseNRazeViewController = UIStoryboard.getViewController(withIdentifier: RRConstants.ViewControllerIdentifiers.KRiseNRazeViewControllerIdentifier.rawValue)
        
        guard riseNRazeViewController != nil else {
            return
        }
        self.present(riseNRazeViewController!, animated: true, completion: nil)

    }
    
}
