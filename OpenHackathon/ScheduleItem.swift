//
//  Schedule.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-08.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import Foundation

class ScheduleItem{
    
    var passed = false
    var toNotify = true
    
    var title: String!
    var info: String!
    var date: NSDate!
    var location: String!
    
    var localNotification: UILocalNotification!
    
    init(title: String, info: String, date: NSDate, location: String, toNotify: Bool){
        self.title = title
        self.info = info
        self.date = date
        self.location = location
        self.toNotify = toNotify
        
//        localNotification = UILocalNotification()
//        localNotification.alertTitle = "Hackwestern Notification"
//        localNotification.alertBody = title+" in 5 minutes!"
//        localNotification.alertAction = "ShowDetails"
//        localNotification.fireDate = date.dateByAddingTimeInterval(-60*5)
//        localNotification.timeZone = NSTimeZone.defaultTimeZone()
//        localNotification.soundName = UILocalNotificationDefaultSoundName
//        localNotification.applicationIconBadgeNumber = 1
//        localNotification.category = "reminderCategory"
//        localNotification.userInfo = ["uid": title]
    }
    
    func getDate() -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        return dateFormatter.stringFromDate(date)
    }
    
    
}