//
//  TaskCell.swift
//  MyToDo
//
//  Created by Admin on 11/27/18.
//  Copyright © 2018 khawla hafsia. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var tasklbl: UILabel!
    
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(task:Taskmodel)
    {
        tasklbl.text = task.Task
     //   datelbl.text = String(task.TaskDate)
        timelbl.text = String(task.Time)
        
    }
    
}
