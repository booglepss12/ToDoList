//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by John Rooney on 2018-04-25.
//  Copyright © 2018 John Rooney. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var toDos:[ToDoCoreData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
     
}
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
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
        if let name = toDo.name{
             if toDo.important {
            cell.textLabel?.text = "❗️" +  name
            }else{
               cell.textLabel?.text = toDo.name
        }
       
    }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "toDoComplete", sender: toDo)
    }
    func getToDos() {
        if let context =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                if let theToDos = coreDataToDos{
                   toDos = theToDos
                    tableView.reloadData()
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController{
        addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompletedViewController{
            if let toDo = sender as? ToDo{
            completeVC.selectedToDo =  toDo
            completeVC.previousVC = self
            }
        }
    }
}
