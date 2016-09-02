//
//  SquareTask.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import UIKit




class SquareTask: UIView {
    
    let taskDescription: String
    let priority:Int
    let difficulty: Int
    let deadline: String
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}