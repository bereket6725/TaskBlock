//
//  TaskView.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/4/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit


class TaskView: UIView {
    
    var task: TaskStruct?
        
    init(myTask: TaskStruct){
        self.task = myTask
        let convertedDifficulty = Int((self.task?.difficulty)!)
       // let convertedPriority = Int((self.task?.priority)!)
        super.init(frame: CGRect(x:0, y:0, width: convertedDifficulty!*75, height:convertedDifficulty!*75))
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 3.0
        
        switch (task!.priority) {
            case "Yellow":
                self.backgroundColor = UIColor.yellowColor()
            case "Orange":
                self.backgroundColor = UIColor.orangeColor()
            case "Red":
                self.backgroundColor = UIColor.redColor()
            default:
                self.backgroundColor = UIColor.grayColor()
        }
        
    }

    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
}
