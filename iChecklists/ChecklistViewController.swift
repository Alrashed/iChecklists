//
//  ChecklistViewController.swift
//  iChecklists
//
//  Created by Khalid Alrashed on 4/11/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var row0text = "label 1"
    var row1text = "label 2"
    var row2text = "lable 3"
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if  indexPath.row == 0 {
            label.text = row0text
        } else if indexPath.row == 1 {
            label.text = row1text
        } else if indexPath.row == 2 {
            label.text = row2text
        }
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if indexPath.row == 0 {
                row0checked = !row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
            }
            
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
