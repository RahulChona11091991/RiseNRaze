//
//  ConfigureWorldViewController.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import UIKit

class ConfigureWorldViewController: UIViewController {

    //MARK: - IBOUTLETS -
    @IBOutlet weak var rowsCountTextField: RiseNRazeTextField!
    @IBOutlet weak var columnsCountTextField: RiseNRazeTextField!
    @IBOutlet weak var applyFirstRuleButton: UIButton!
    @IBOutlet weak var applySecondRuleButton: UIButton!
    @IBOutlet weak var applyThirdRuleButton: UIButton!
    @IBOutlet weak var applyFourthRuleButton: UIButton!
    
    //MARK: - VIEWCONTROLLER LIFECYCLE METHODS -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - ACTIONS -
    @IBAction func applyRule(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.tag == 1 { //Rule#1
            FutureGenerationManager.sharedManager().isRuleOneEnabled = sender.isSelected
            sender.isSelected ? sender.setTitle("Rule#1 Applied", for: .selected) : sender.setTitle("Apply Rule#1", for: .normal)
        } else if sender.tag == 2 { //Rule#2
            FutureGenerationManager.sharedManager().isRuleTwoEnabled = sender.isSelected
            sender.isSelected ? sender.setTitle("Rule#2 Applied", for: .selected) : sender.setTitle("Apply Rule#2", for: .normal)
        } else if sender.tag == 3 { //Rule#3
            FutureGenerationManager.sharedManager().isRuleThirdEnabled = sender.isSelected
            sender.isSelected ? sender.setTitle("Rule#3 Applied", for: .selected) : sender.setTitle("Apply Rule#3", for: .normal)
        } else if sender.tag == 4 { //Rule#4
            FutureGenerationManager.sharedManager().isRuleFourthEnabled = sender.isSelected
            sender.isSelected ? sender.setTitle("Rule#4 Applied", for: .selected) : sender.setTitle("Apply Rule#4", for: .normal)
        }
    }
    
    @IBAction func begin(_ sender: Any) {
        if validateData() {
                FutureGenerationManager.sharedManager().row = Int(rowsCountTextField.text ?? "0") ?? 0
                FutureGenerationManager.sharedManager().column = Int(columnsCountTextField.text ?? "0") ?? 0
                self.presentRiseNRazeViewController()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var shouldAutorotate: Bool {
        return false
    }
}

extension ConfigureWorldViewController {
    func validateData() -> Bool {
        if (rowsCountTextField.text?.count ?? 0) > 0 && (columnsCountTextField.text?.count ?? 0) > 0 {
            
            if ((Int((rowsCountTextField.text ?? "0")) ?? 0) > RRConstants.NumberOfLivesBound.Lower.rawValue && (Int((rowsCountTextField.text ?? "0")) ?? 0) <= RRConstants.NumberOfLivesBound.Upper.rawValue) && ((Int((columnsCountTextField.text ?? "0")) ?? 0) > RRConstants.NumberOfLivesBound.Lower.rawValue && (Int((columnsCountTextField.text ?? "0")) ?? 0) <= RRConstants.NumberOfLivesBound.Upper.rawValue) {
                return true
            }
        }
        return false
    }
}
