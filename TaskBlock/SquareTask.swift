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
    let size: Int
    let color: UIColor

    init(taskDescription: String, priority: Int, difficulty: Int, deadline: String, color: UIColor){
        self.taskDescription = taskDescription
        self.priority = priority
        self.deadline = deadline
        self.difficulty = difficulty
        self.color = color
        self.size = 3*(priority+difficulty)
        super.init(frame:CGRect(x: 0, y: 0, width: size, height: size))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}