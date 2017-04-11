//
//  ChecklistItem.swift
//  iChecklists
//
//  Created by Khalid Alrashed on 4/11/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
