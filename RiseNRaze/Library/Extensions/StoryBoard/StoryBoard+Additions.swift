//
//  StoryBoard+Additions.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 12/01/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation
import UIKit

//MARK: - STORYBOARD EXTENSION -
extension UIStoryboard {
    
    class func getMainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func getViewController(withIdentifier: String) -> UIViewController? {
        return UIStoryboard.getMainStoryBoard().instantiateViewController(withIdentifier: withIdentifier)
    }
}
