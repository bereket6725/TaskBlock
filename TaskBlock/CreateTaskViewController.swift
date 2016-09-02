//
//  CreateTaskViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var priorityTextField: UITextField!
    
    @IBOutlet weak var difficultyTextField: UITextField!
    
    @IBOutlet weak var deadlineTextField: UITextField!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @IBAction func SaveButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
