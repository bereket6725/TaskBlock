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
    let motionQueue = NSOperationQueue()
    
    // let task = TriangleTask()
    
    lazy var animator: UIDynamicAnimator = {
        let a = UIDynamicAnimator(referenceView: self.view)
        return a
    }()
    
    lazy var gravity: UIGravityBehavior = {
        let g = UIGravityBehavior()
        self.animator.addBehavior(g)
        return g
    }()
    
    lazy var collision: UICollisionBehavior = {
        let c = UICollisionBehavior()
        c.translatesReferenceBoundsIntoBoundary = true
        self.animator.addBehavior(c)
        return c
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addTask))
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("tasks") as? NSData{
            let tasksArray = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [UIView]
            releaseTheTasks(tasksArray!)
        }
        else{
            print("yo we got an error")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func releaseTheTasks(array:[UIView]){
        for task in array{
            view.addSubview(task)
            collision.addItem(task)
            gravity.addItem(task)
            
        }
        motionManager.startDeviceMotionUpdatesToQueue(motionQueue, withHandler: {
            motion, error in
            
            guard let gravity = motion?.gravity else {return}
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                // do some task
                dispatch_async(dispatch_get_main_queue()) {
                    // update some UI
                    self.gravity.gravityDirection = CGVector(dx: gravity.x, dy: -gravity.y)
                    
                }
            }
            
            
        })
        
    }
    
  

    func addTask(){
        
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateTaskIdentifier") as! CreateTaskViewController
        self.presentViewController(vc, animated: true, completion: nil)
        //self.presentViewController(vc, animated: true, completion: nil)
        // presentViewController(vc, animated: true, completion: nil)
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

