//
//  HackathonInfo.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import Foundation

enum Page: Int{
    case Home = 0, Schedule, Updates, Maps, Mentors, Sponsors
}

struct HackathonInfo{
    
    //time that hackathon ends
    static let endTimeStr = "11/23/2015 1:55:00 am"
    static var endTime: NSDate!{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm:ss a"
        return formatter.dateFromString(endTimeStr)
    }
    
    //time left
    static var timeLeft: OHTime!{
        var retVal = OHTime(seconds: endTime.timeIntervalSinceDate(NSDate()))
        if retVal.time > 36*3600{return OHTime(seconds: 36*3600)}
        else if retVal.time < 0{return OHTime(seconds: 0)}
        else {return retVal}
    }
    
    //current screen selected
    static var currentPageInView: Page = .Home
    
}