//
//  CreateTaskViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    
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
