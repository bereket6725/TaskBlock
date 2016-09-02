//
//  ViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
   
   // let task = TriangleTask()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addTask))
        
        //task.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        //self.view.addSubview(task)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addTask(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

