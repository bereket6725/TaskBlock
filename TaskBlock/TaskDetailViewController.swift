//
//  TaskDetailViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/5/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var detailTaskDescriptionTextView: UITextView!
    
    @IBOutlet weak var deadlineTextLabel: UILabel!

    @IBOutlet weak var difficultyTextLabel: UILabel!
    
    @IBOutlet weak var PriorityTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    
}
