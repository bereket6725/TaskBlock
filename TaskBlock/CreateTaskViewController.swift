//
//  CreateTaskViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    var taskDescriptionInput: String?
    var priorityInput: String?
    var deadlineInput: String?
    var difficultyInput: String?
    
    
    
    @IBOutlet weak var descriptionTextField: UITextField!{
        didSet {
            taskDescriptionInput = descriptionTextField.text
        }
    }
    
    @IBOutlet weak var priorityTextField: UITextField! {
        didSet {
            priorityInput = priorityTextField.text
           // print(priorityInput)
        }
    }
    
    @IBOutlet weak var difficultyTextField: UITextField!{
        didSet {
            difficultyInput = difficultyTextField.text
           // print(difficultyInput)
        }
    }
    
    @IBOutlet weak var deadlineTextField: UITextField!{
        didSet {
            deadlineInput = deadlineTextField.text
          //  print(deadlineInput)
        }
    }
    
    var blockShapeButtonString: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        descriptionTextField.delegate = self
        priorityTextField.delegate = self
        difficultyTextField.delegate = self
        deadlineTextField.delegate = self
    }
    
    
    @IBAction func blockShapeButtonTapped(sender: AnyObject) {
        
        if let text = sender.currentTitle! {
            switch text {
            case "Circle":
                print("circle :D")
                blockShapeButtonString = "Circle"
            case "Triangle":
                print("triangle :D")
                blockShapeButtonString = "Triangle"
            case "Square":
                print("square :D")
                blockShapeButtonString = "Square"
            case "Rectangle":
                print("rectangle :D")
                blockShapeButtonString = "Rectangle"
            default:
                print("be a janitor instead")
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func createTaskBlock(taskShape:String) -> AnyObject?{
        taskDescriptionInput = descriptionTextField.text
        priorityInput = priorityTextField.text
        difficultyInput = difficultyTextField.text
        deadlineInput   = deadlineTextField.text 
        
        switch taskShape {
            case "Circle":
            let task = CircleTask(taskDescription:taskDescriptionInput!, priority: Int(priorityInput!)!, difficulty: Int(difficultyInput!)!, deadline: deadlineInput!)
            return task
            case "Square":
            let task = SquareTask(taskDescription:taskDescriptionInput!, priority: Int(priorityInput!)!, difficulty: Int(difficultyInput!)!, deadline: deadlineInput!)
            return task
            case "Rectangle":
            let task = rectangleTask(taskDescription:taskDescriptionInput!, priority: Int(priorityInput!)!, difficulty: Int(difficultyInput!)!, deadline: deadlineInput!)
            return task
            case "Triangle":
            let task = TriangleTask(taskDescription:taskDescriptionInput!, priority: Int(priorityInput!)!, difficulty: Int(difficultyInput!)!, deadline: deadlineInput!)
            return task
            default:
            print("error")
            return nil
        }
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    func savePlaces(){
    }
    @IBAction func SaveButtonTapped(sender: AnyObject) {
        //call createTaskBlock
        let newTask = createTaskBlock(blockShapeButtonString!)
        if var array = NSUserDefaults.standardUserDefaults().arrayForKey("tasks") {
            array.append(newTask!)
            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(array)
            NSUserDefaults.standardUserDefaults().setObject(encodedData, forKey: "tasks")
            
        }
        else{
            
            let array: [AnyObject] = [newTask!]
            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(array)
            NSUserDefaults.standardUserDefaults().setObject(encodedData, forKey: "tasks")

        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
