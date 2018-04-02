//
//  ViewController.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 29/03/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import UIKit

class RiseNRazeViewController: UIViewController {
    
    //MARK: - VARIABLES -
    var world: [[Int]] = []
    
    //MARK: - IBOUTLETS -
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - VIEWCONTROLLER LIFECYCLE METHODS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - ACTIONS -
    @IBAction func back(_ sender: Any) {
        rotateToPortraitMode()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RiseNRazeViewController {
    private func setupView() {
        generateUniqueLevel()
        print("Original Generation")
        FutureGenerationManager.sharedManager().printWorldGrid(world: world)
    }
    
    private func generateUniqueLevel() {
        world = Array(repeating: Array(repeating: 0, count: FutureGenerationManager.sharedManager().column), count: FutureGenerationManager.sharedManager().row)
        for index in 0 ..< FutureGenerationManager.sharedManager().row {
            for subIndex in 0 ..< FutureGenerationManager.sharedManager().column {
                world[index][subIndex] = randomNumber()
            }
        }
    }
    
    private func rotateToPortraitMode() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}
