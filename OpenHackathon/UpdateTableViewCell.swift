//
//  UpdateTableViewCell.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {

    //data
    var update: Update!
    
    //main view
    @IBOutlet weak var updateCardView: UIView!
    
    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //format colours
        self.backgroundColor = UIColor.clearColor()
        updateCardView.backgroundColor = OHColor.updateTableViewCardColor
        
        //format border
        updateCardView.layer.cornerRadius = 5
        
        //format title text
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: "Helvetica", size: 24)
        //format date text
        dateLabel.textColor = OHColor.updateTableViewBackgroundColor
        dateLabel.font = UIFont(name: "Helvetica", size: 14)
        //format info text
        infoLabel.textColor = UIColor.whiteColor()
        infoLabel.font = UIFont(name: "Helvetica", size: 16)
        infoLabel.sizeToFit()
        
        
    }
    
    func pop(){
        //set update
        if update != nil{
            titleLabel.text = update.title
            dateLabel.text = update.dateAsString()
            infoLabel.text = update.info
        }
    }

}
