//
//  IconPickerViewController.swift
//  iChecklists
//
//  Created by Khalid Alrashed on 4/13/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [ "No Icon",
                  "Appointments",
                  "Birthdays",
                  "Chores",
                  "Drinks",
                  "Folder",
                  "Groceries",
                  "Inbox",
                  "Photos",
                  "Trips" ]
}
