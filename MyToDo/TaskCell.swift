//
//  TaskCell.swift
//  MyToDo
//

import UIKit

class TaskCell: UITableViewCell
{
    @IBOutlet weak var TaskLbl: UILabel!
    @IBOutlet weak var TimeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
    func UpdateUI(task: Taskmodel)
    {
        
    }

}
