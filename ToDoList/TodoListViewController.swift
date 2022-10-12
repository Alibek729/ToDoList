//
//  ViewController.swift
//  ToDoList
//
//  Created by Alibek Kozhambekov on 12.10.2022.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demodragon"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Add new button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New item to List", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
}

