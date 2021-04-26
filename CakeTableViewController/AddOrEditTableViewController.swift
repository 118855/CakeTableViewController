//
//  AddOrEditTableViewController.swift
//  CakeTableViewController
//
//  Created by admin on 26.04.2021.
//

import UIKit

class AddOrEditTableViewController: UITableViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var componentsTextView: UITextView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var imageViewAdd: UIImageView!
    
    var cake: Cake?
    
    init? (coder: NSCoder, cake: Cake?) {
        self.cake = cake
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newCakeCell()
    }
    
    
    func newCakeCell() {
        if let cake = cake {
            nameTextField.text = cake.name
            componentsTextView.text = cake.components
            descriptionTextView.text = cake.description
            imageViewAdd.image = UIImage(named: cake.name)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue" {
            let name = nameTextField.text ?? ""
            let component = componentsTextView.text ?? ""
            let description = descriptionTextView.text ?? ""
            cake = Cake(name: name, components: component, description: description)
        }
    }

}
