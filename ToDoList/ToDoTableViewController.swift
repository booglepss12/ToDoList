//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by John Rooney on 2018-04-25.
//  Copyright © 2018 John Rooney. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos:[ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       toDos = createToDo()
        
    }
    func createToDo() -> [ToDo]{
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = true
       
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        
        let cheese = ToDo()
        cheese.name = "Buy Cheese"
        
        return [dog, eggs, cheese]
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        }else{
             cell.textLabel?.text = toDo.name
        }
       return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addVC = segue.destination as! AddToDoViewController
        addVC.previousVC = self
    }
}
