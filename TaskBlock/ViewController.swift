//
//  ViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, CreateTaskViewControllerDelegate {
    
    let motionManager = CMMotionManager()
    let motionQueue = NSOperationQueue()
    
    // let task = TriangleTask()
    let blueBlock = UIView()
    
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
    
    var createdTask: TaskStruct? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
        blueBlock.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        blueBlock.backgroundColor = UIColor.blueColor()
        blueBlock.layer.borderColor = UIColor.blackColor().CGColor
        blueBlock.layer.borderWidth = 3.0
        view.addSubview(blueBlock)
        
        collision.addItem(blueBlock)
        gravity.addItem(blueBlock)
        
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
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func acceptData(data: TaskStruct!) {
        self.createdTask = data
        createTaskView(self.createdTask!)
    }
    
    func createTaskView(Task: TaskStruct){
        let newTaskView = TaskView(myTask: Task)
        view.addSubview(newTaskView)
        collision.addItem(newTaskView)
        gravity.addItem(newTaskView)
        
    }
    
    @IBAction func AddTaskButtonTapped(sender: AnyObject) {
      let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateTaskIdentifier") as UIViewController
        
       self.presentViewController(viewController, animated: true, completion: nil)
        
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

