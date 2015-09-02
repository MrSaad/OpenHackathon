//
//  Update.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import Foundation

class Update{
    
    var title: String!
    var time: NSDate!
    var info: String!
    
    required init(title: String, time: NSDate, info: String){
        self.title = title
        self.time = time
        self.info = info
    }
    
    func dateAsString() -> String{
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE, h:mm a"
        return dayTimePeriodFormatter.stringFromDate(time)
    }
}