//
//  Helper.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation

func randomNumber(range: ClosedRange<Int> = 0...1) -> Int {
    let min = range.lowerBound
    let max = range.upperBound
    return Int(arc4random_uniform(UInt32(1 + max - min))) + min
}
