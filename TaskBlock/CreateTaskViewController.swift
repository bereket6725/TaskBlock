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

enum color{
    case Yellow
    case Orange
    case Red
}

class CreateTaskViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var delegate: CreateTaskViewControllerDelegate?
    //var data: TaskStruct?
    
    var pickerDataSource = [["Priority","Yellow","Orange","Red"],["Difficulty","1","2","3"]]
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
        return 2
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource[component].count
        
        
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
        
        if descriptionTextField.text != "" && deadlineTextField.text != "" {
            
            if pickerDataSource[0][taskPicker.selectedRowInComponent(0)] != "Priority" && pickerDataSource[1][taskPicker.selectedRowInComponent(1)] != "Difficulty"{
                
                self.dismissViewControllerAnimated(true, completion: nil)

            }
            else{
                
                let alertController = UIAlertController(title: "Invalid", message: "please type in a valid task", preferredStyle: .Alert)
                
                let OkAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(OkAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
        }
        

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
