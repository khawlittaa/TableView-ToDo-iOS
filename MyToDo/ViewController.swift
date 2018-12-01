//
//  ViewController.swift
//  MyToDo
//
//  Created by Admin on 11/23/18.
//  Copyright © 2018 khawla hafsia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate
{
 
    // my list of todos using core data
    var ToDos: [NSManagedObject] = []
    
    @IBOutlet weak var ToDosTableView: UITableView!
    
    @IBOutlet weak var addbtn: UIBarButtonItem!

    override func viewDidLoad()
    {
        title = "My Todos"
        super.viewDidLoad()
        
        
    }
    
    // fetching % desplaying data  saved in my  core data model when the view appears to the user 
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //ref to core data object
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // requesting my data from core data object
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDo")
        
        // fetching my data from the coredata model and desplaying it
        do
        {
            ToDos = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError
        {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ToDos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let todo = ToDos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = todo.value(forKeyPath: "task") as? String
        return cell
    }
    
    @IBAction func EditPressed(_ sender: Any)
    {
        // enableling editting on my table view 
          ToDosTableView.isEditing = true
        // ToDosTableView.isEditing = false
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            ToDos.remove(at: indexPath.row)
           ToDosTableView.deleteRows(at: [indexPath], with: .fade)
            ToDosTableView.isEditing = false
        }
       
    }
    
    // showing the pop up to add a new task to my todos
    @IBAction func AddNewToDoPressed(_ sender: Any)
    {
        let alert = UIAlertController(title: "New ToDo", message: "Add a new ToDo", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let ToDoToSave = textField.text else
            {
                return
            }
            // saving my task in core data to persist in momory
            self.save(task: ToDoToSave)
            self.ToDosTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    // methode save saves my task in core data model
    func save(task: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
                return
        }
        
        // creating a managed object to use core data
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // instensiating my entity
        let entity =  NSEntityDescription.entity(forEntityName: "ToDo", in: managedContext)!
        
        let todo = NSManagedObject(entity: entity, insertInto: managedContext)
        
        /* saving my data in core data entity  using KVC key (same naming as in core data entity model)*/
        todo.setValue(task, forKeyPath: "task")
        
        // comiting my changes to core ata mdel & managing exceptions
        do
        {
            try managedContext.save()
            ToDos.append(todo)
        }
        catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }


}

