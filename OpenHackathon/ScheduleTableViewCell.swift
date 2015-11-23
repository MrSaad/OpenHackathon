//
//  ScheduleTableViewCell.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-02.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit
import SwiftyJSON

class ScheduleTableViewCell: UITableViewCell {
    
    var delegate: ScheduleTableViewController?

    //the schedule item
    var scheduleItem: ScheduleItem!
    
    var toNotify = false
    
    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
//    @IBOutlet weak var addScheduleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //format title text
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: "Helvetica", size: 20)
        //format time label
        timeLabel.textColor = UIColor.darkGrayColor()
        timeLabel.font = UIFont(name: "Helvetica", size: 16)
        //format location text
        locationLabel.textColor = OHColor.darkGrayColor()
        locationLabel.font = UIFont(name: "Helvetica", size: 14)
        //format info label
        infoLabel.textColor = UIColor.blackColor()
        infoLabel.font = UIFont(name: "Helvetica", size: 16)
        infoLabel.sizeToFit()
        
//        addScheduleButton.hidden = true
        
    }
    
    func populate(){
        
        //format for time
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        //populate fields
        titleLabel.text = scheduleItem.title
        locationLabel.text = scheduleItem.location
        timeLabel.text = dateFormatter.stringFromDate(scheduleItem.date)
        infoLabel.text = scheduleItem.info
    }
    
//    @IBAction func addScheduleButtonSelected(sender: UIButton) {
//        
//        //if no reminder has been set, then create a reminder
//        if(scheduleItem.toNotify == false){
//            scheduleItem.localNotification.fireDate = NSDate().dateByAddingTimeInterval(7)
//            UIApplication.sharedApplication().scheduleLocalNotification((scheduleItem.localNotification)!)
//            scheduleItem.toNotify = true
//            notifDict[scheduleItem.title!] = true
//        }
//        
//        //otherwise remove the reminder
//        else{
//            let uidtodelete = scheduleItem.title
//            
//            let app:UIApplication = UIApplication.sharedApplication()
//            for oneEvent in app.scheduledLocalNotifications! {
//                let notification = oneEvent as UILocalNotification
//                let userInfoCurrent = notification.userInfo as! [String:AnyObject]
//                let uid = userInfoCurrent["uid"] as! String
//                if uid == uidtodelete {
//                    //Cancelling local notification
//                    app.cancelLocalNotification(notification)
//                    break;
//                }
//            }
//            
//            scheduleItem.toNotify = false
//            notifDict[scheduleItem.title!] = false
//        }
//
//        delegate!.tableView.reloadData()
//    }
    

}
