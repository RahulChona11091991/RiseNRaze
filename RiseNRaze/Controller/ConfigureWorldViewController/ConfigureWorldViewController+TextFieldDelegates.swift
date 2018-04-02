//
//  RiseNRazeViewController+TextFieldDelegates.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import UIKit

extension ConfigureWorldViewController:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        
        if ((textField.text ?? "") + string).count > 2 {
            return false
        }
        return true
    }
}
