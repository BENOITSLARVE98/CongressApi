//
//  RedditCell.swift
//  BenoitSlarveCE05
//
//  Created by Slarve N. on 01/19/2020.
//  Copyright © 2019 Slarve N. All rights reserved.
//

import UIKit

class RedditCell: UITableViewCell {

    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var party: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
}
