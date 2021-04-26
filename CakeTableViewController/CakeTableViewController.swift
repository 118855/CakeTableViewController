//
//  CakeTableViewController.swift
//  CakeTableViewController
//
//  Created by admin on 26.04.2021.
//

import UIKit

class CakeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        let tableViewEditing = tableView.isEditing
        tableView.setEditing(!tableViewEditing, animated: true)
    }
    
    @IBSegueAction func addOrEdit(_ coder: NSCoder, sender: Any?) -> AddOrEditTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let cakeEdit = cakes[indexPath.row]
            return AddOrEditTableViewController(coder: coder, cake: cakeEdit)
        } else {
            return AddOrEditTableViewController(coder: coder, cake: nil)
        }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cakes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeCell", for: indexPath) as! CakeTableViewCell
        let cake = cakes[indexPath.row]
        cell.updateCell(with: cake)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cakes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedCake = cakes.remove(at: fromIndexPath.row)
        cakes.insert(movedCake, at: to .row)

    }
    
    // MARK: - Navigation
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue",
              let sourceViewController = segue.source as? AddOrEditTableViewController,
              let cake = sourceViewController.cake else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            cakes[selectedIndexPath.row] = cake
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            
        } else {
            let newIndexPath = IndexPath(row: cakes.count, section: 0)
            cakes.append(cake)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
