//
//  UserTableViewCell.swift
//  machineTestTherd
//
//  Created by Macintosh on 19/01/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var fristNameLabel: UILabel!
    
    @IBOutlet weak var lastnamelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
