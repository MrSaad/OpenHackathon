//
//  OHTime.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.

import Foundation

struct OHTime{
    
    //computed time intervals
    var timeInSeconds: Int{
        return Int(time)%60
    }
    var timeInMillis: Int{
        return Int(time*1000)%1000
    }
    var timeInMinutes: Int {
        return Int(time/60)%60
    }
    var timeInHours: Int {
        return Int(time/3600)
    }
    
    //real time
    var time: NSTimeInterval!{
        didSet{
            if self.time < 0.01{self.time = 0}
            if self.time >= 1000000000{self.time = 0}
        }
    }
    
    //initialize with initial real time
    init(seconds: NSTimeInterval){
        time = seconds
        //        if time < 0.001{time=0.001}
    }
    
    //string version of milliseconds
    var millisStr: String{
        return timeInMillis > 9 ? timeInMillis > 99 ? String(timeInMillis):"0" + String(timeInMillis)
            :"00" + String(timeInMillis)
    }
    
    //string verion of seconds
    var secStr: String{
        return timeInSeconds > 9 ? String(timeInSeconds):"0" + String(timeInSeconds)
    }
    
    //string version of minutes
    var minStr: String{
        return timeInMinutes > 9 ? String(timeInMinutes):"0" + String(timeInMinutes)
    }
    
    //string version of hours
    var hrStr: String{
        return timeInHours > 9 ? String(timeInHours):"0" + String(timeInHours)
    }
    
    //string version of min:sec form
    var minSecForm: String{
        return minStr+":"+secStr
    }
    
    //string version of hr:min:sec form
    var hrMinSecForm: String{
        return hrStr+":"+minStr+":"+secStr
    }
    
    //string version of date for voice feedback
    var speechForm: String{
        
        //add seconds
        var retStr: String = String(timeInSeconds)+" second"
        if timeInSeconds != 1{ retStr+="s"}
        
        //add minutes
        if(timeInMinutes>0){
            var minuteString = " "+String(timeInMinutes)+" minute"
            if (timeInMinutes != 1){minuteString += "s"}
            minuteString += " and "
            retStr = minuteString + retStr
            
            //add hours
            if(timeInHours > 0){
                var hourString = String(timeInHours)+" hour"
                if(timeInHours != 1){hourString += "s"}
                retStr = hourString + retStr
            }
        }
        return retStr
        
    }
}