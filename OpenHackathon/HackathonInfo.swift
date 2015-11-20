//
//  HackathonInfo.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import Foundation

enum Page: Int{
    case Home = 0, Schedule, Updates, Maps, Sponsors, Mentors
}

struct HackathonInfo{
    
    //time that hackathon ends
    static let endTimeStr = "11/20/2015 11:25:00 pm"
    static var endTime: NSDate!{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm:ss a"
        return formatter.dateFromString(endTimeStr)
    }
    
    //time left
    static var timeLeft: OHTime!{
       return OHTime(seconds: endTime.timeIntervalSinceDate(NSDate()))
    }
    
    //current screen selected
    static var currentPageInView: Page = .Home
    
}