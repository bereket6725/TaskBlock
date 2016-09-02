//
//  RectangleTask.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import UIKit



class rectangleTask:UIView {
    
    var taskDescription: String
    var priority:Int
    var difficulty: Int
    var deadline: String
    var size: Int
   // let color: UIColor
    
    init(taskDescription: String, priority: Int, difficulty: Int, deadline: String){
        
        self.taskDescription = taskDescription
        self.priority = priority
        self.deadline = deadline
        self.difficulty = difficulty
        self.size = 3*(priority+difficulty)
        //self.color = color
        
        super.init(frame:CGRect(x: 0, y: 0, width: size/2, height: size))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}