//
//  CompletedViewController.swift
//  ToDoList
//
//  Created by John Rooney on 2018-05-01.
//  Copyright © 2018 John Rooney. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func completeButton(_ sender: Any) {
        if let context =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
        }
        }
       /* var index = 0
        for toDo in previousVC.toDos{
            if toDo.name == selectedToDo.name{
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
           index += 1
        }
    }*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo?.name
        
        // Do any additional setup after loading the view.
    }


}

