//
//  ListDetailViewController.swift
//  iChecklists
//
//  Created by Khalid Alrashed on 4/11/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding list: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing list: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    var listToEdit: Checklist?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let list = listToEdit {
            title = "Edit list"
            textField.text = list.name
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let list = listToEdit {
            list.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: list)
        } else {
            let list = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAdding: list)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
}
