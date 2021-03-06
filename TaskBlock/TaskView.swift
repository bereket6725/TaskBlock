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
        //the math here for the width and height was pretty arbitrary, but it feels like a good size when its run to me. This was a pretty subjective call
        super.init(frame: CGRect(x:0, y:0, width: convertedDifficulty!*40, height:convertedDifficulty!*40))
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 3.0
        //switch case to determine the color of the TaskView
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
           
    }



    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
}
