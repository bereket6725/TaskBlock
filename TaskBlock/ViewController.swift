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
//        let button = UIButton(frame:newTaskView.bounds)
//        
//        button.titleLabel?.text = ""
//        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        
//        newTaskView.addSubview(button)
        collision.addItem(newTaskView)
        gravity.addItem(newTaskView)
        

    }
    
//    func buttonAction(sender: UIButton!){
//        
//        if sender.touchInside == true {
//           let vc = storyboard?.instantiateViewControllerWithIdentifier("TaskDetailIdentifier")
//           self.presentViewController(vc!, animated: true, completion: nil)
//            
//        }
//    }
    
    @IBAction func AddTaskButtonTapped(sender: AnyObject) {
//      let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateTaskIdentifier") as UIViewController
        
        let ctvc = storyboard?.instantiateViewControllerWithIdentifier("CreateTaskIdentifier") as! CreateTaskViewController
        ctvc.delegate = self 
        self.presentViewController(ctvc, animated: true, completion: nil)
    }
  
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        // Only allow Portrait
        return UIInterfaceOrientation.Portrait
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

