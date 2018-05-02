//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by John Rooney on 2018-04-26.
//  Copyright © 2018 John Rooney. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: Any) {
        //use the following to get to core data
        if let context =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
        }
       try? context.save()
        navigationController?.popViewController(animated: true)
    }
 }
}
