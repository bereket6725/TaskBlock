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
    
    let motionManager = CMMotionManager()
    let operationQueue = NSOperationQueue()
    
    // let task = TriangleTask()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addTask))
//        if let array = NSUserDefaults.standardUserDefaults().arrayForKey("tasks"){
//           
//        }
        //task.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        //self.view.addSubview(task)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addTask(){
        
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateTaskIdentifier") as! CreateTaskViewController
        self.presentViewController(vc, animated: true, completion: nil)
        //self.presentViewController(vc, animated: true, completion: nil)
        // presentViewController(vc, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

