//
//  ScheduleTableViewCell.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-02.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    var delegate: ScheduleTableViewController?

    //selected status
    var addedToSchedule = false
    
    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var addScheduleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //format title text
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: "Helvetica", size: 24)
        //format time label
        timeLabel.textColor = UIColor.darkGrayColor()
        timeLabel.font = UIFont(name: "Helvetica", size: 18)
        //format location text
        locationLabel.textColor = OHColor.darkGrayColor()
        locationLabel.font = UIFont(name: "Helvetica", size: 14)
        //format info label
        infoLabel.textColor = UIColor.blackColor()
        infoLabel.font = UIFont(name: "Helvetica", size: 16)
        infoLabel.sizeToFit()
    }
    
    @IBAction func addScheduleButtonSelected(sender: UIButton) {
        addedToSchedule = !addedToSchedule
        delegate!.tableView.reloadData()
    }
    

}
