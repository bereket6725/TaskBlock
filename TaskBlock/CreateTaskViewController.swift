//
//  CreateTaskViewController.swift
//  TaskBlock
//
//  Created by Bereket Ghebremedhin on 9/2/16.
//  Copyright © 2016 Bereket Ghebremedhin. All rights reserved.
//

import UIKit


protocol CreateTaskViewControllerDelegate{
    func acceptData(data: TaskStruct!)
}
 
class CreateTaskViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var delegate: CreateTaskViewControllerDelegate?
    //var data: TaskStruct?
    
    var pickerDataSource = [["Priority","1","2","3"],["Difficulty","1","2","3"],["Color","Red","Blue","yellow"],["Shape TBD","Square","Circle","Triangle"]]
    var taskDescriptionInput: String?
    var blockShapeButtonString: String?

    
    @IBOutlet weak var taskPicker: UIPickerView!
    
    @IBOutlet weak var deadlineTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!{
        didSet {
            taskDescriptionInput = descriptionTextField.text
        }
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        taskPicker.dataSource = self
        taskPicker.delegate = self
        
    }
    
    //PickerViewDataSource and Delegate Methods-------------------------------------------
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
        
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[component][row]
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //------------------------------------------------------------------------------------

    @IBAction func createTaskButtonTapped(sender: AnyObject) {
        if descriptionTextField.text == "" && deadlineTextField.text == ""{
            if taskPicker.selectedRowInComponent(0) == "Priority" && taskPicker.selectedRowInComponent(1) == "Difficulty"{
                
            var priority = taskPicker.selectedRowInComponent(0)
            var difficulty = taskPicker.selectedRowInComponent(1)
            var color = taskPicker.selectedRowInComponent(2)
            var taskDescription = descriptionTextField.text
            var deadline = deadlineTextField.text
            
            var newTask = TaskStruct(taskDescription: taskDescription!, deadline:deadline!, priority: priority, difficulty: difficulty, color: color)
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.acceptData(<#T##data: TaskStruct!##TaskStruct!#>)

    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
  
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
       
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
