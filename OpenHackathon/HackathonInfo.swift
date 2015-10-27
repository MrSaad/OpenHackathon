//
//  HackathonInfo.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import Foundation

struct HackathonInfo{
    
    //time that hackathon ends
    static let endTimeStr = "10/29/2015 12:15:00"
    static var endTime: NSDate!{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        return formatter.dateFromString(endTimeStr)
    }
    
    //time left 
    static var timeLeft: OHTime!{
       return OHTime(seconds: endTime.timeIntervalSinceDate(NSDate()))
    }
}