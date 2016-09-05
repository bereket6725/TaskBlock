//
//  TaskView.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/4/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit


class TaskView: UIView, UIGestureRecognizerDelegate {
    
    var task: TaskStruct?
        
    init(myTask: TaskStruct){
        self.task = myTask
        let convertedDifficulty = Int((self.task?.difficulty)!)
       // let convertedPriority = Int((self.task?.priority)!)
        super.init(frame: CGRect(x:0, y:0, width: convertedDifficulty!*40, height:convertedDifficulty!*40))
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 3.0
        
        switch (task!.priority) {
            case "Yellow":
                self.backgroundColor = UIColor.yellowColor()
            case "Orange":
                self.backgroundColor = UIColor.orangeColor()
            case "Red":
                self.backgroundColor = UIColor.redColor()
            case "Green":
                self.backgroundColor = UIColor.greenColor()
            case "Purple":
                self.backgroundColor = UIColor.purpleColor()
            default:
                self.backgroundColor = UIColor.grayColor()
            
            
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        self.userInteractionEnabled = true
        self.addGestureRecognizer(tap)
    
    }

    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
}
