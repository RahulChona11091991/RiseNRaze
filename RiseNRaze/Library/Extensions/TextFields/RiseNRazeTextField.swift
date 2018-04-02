//
//  RiseNRazeTextField.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import UIKit

@IBDesignable
class RiseNRazeTextField: UITextField {
    
    @IBInspectable var isPasteEnabled: Bool = true
    
    @IBInspectable var isSelectEnabled: Bool = true
    
    @IBInspectable var isSelectAllEnabled: Bool = true
    
    @IBInspectable var isCopyEnabled: Bool = true
    
    @IBInspectable var isCutEnabled: Bool = true
    
    @IBInspectable var isDeleteEnabled: Bool = true
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        switch action {
        case #selector(UIResponderStandardEditActions.paste(_:)) where !isPasteEnabled,
             #selector(UIResponderStandardEditActions.select(_:)) where !isSelectEnabled,
             #selector(UIResponderStandardEditActions.selectAll(_:)) where !isSelectAllEnabled,
             #selector(UIResponderStandardEditActions.copy(_:)) where !isCopyEnabled,
             #selector(UIResponderStandardEditActions.cut(_:)) where !isCutEnabled,
             #selector(UIResponderStandardEditActions.delete(_:)) where !isDeleteEnabled:
            return false
        default:
            //return true : this is not correct
            return super.canPerformAction(action, withSender: sender)
        }
    }
}
