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
        let convertedPriority = Int((self.task?.priority)!)
        super.init(frame: CGRect(x:0, y:0, width: convertedDifficulty!*75, height:convertedPriority!*75))
    }

    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
}
