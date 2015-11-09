//
//  MenuTableViewCell.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-08.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //format text
        titleLabel.font = UIFont(name: "Helvetica", size: 20)
        
    }

}
