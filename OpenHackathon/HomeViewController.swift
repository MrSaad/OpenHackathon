//
//  HomeViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-12.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    //menu
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //labels
    @IBOutlet weak var countdownClock: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var recentUpdatesLabel: UILabel!
    @IBOutlet weak var recentUpdatesText: UITextView!
    
    
    //timer
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set menu toggle
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //set nav bar title
        self.navigationItem.title = "HackWestern 2015"
        
        //format background color
        self.view.backgroundColor = UIColor.blackColor()
        
        //format countdown clock
        countdownClock.font = UIFont(name: "Helvetica-Light", size: 60)
        //countdown timer updates
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: aSelector, userInfo: nil, repeats: true)

        //format time left label
        timeLeftLabel.textColor = UIColor.lightGrayColor()
        timeLeftLabel.font = UIFont(name: "Helvetica", size: 14)
        
        //format recent updates label
        recentUpdatesLabel.text = "Recent Updates"
        recentUpdatesLabel.textColor = UIColor.whiteColor()
        recentUpdatesText.backgroundColor = UIColor.blackColor()
        recentUpdatesText.textColor = UIColor.lightGrayColor()
        
    }

    override func viewDidAppear(animated: Bool) {
        recentUpdatesText.scrollRangeToVisible(NSRange(location:0, length:0))
    }
    
    //update the the countdown timer
    func updateTime(){
        if(HackathonInfo.timeLeft.time <= 0){ countdownClock.text = "00:00:00" }
        else{ countdownClock.text = HackathonInfo.timeLeft.hrMinSecForm }
        countdownClock.textColor = timeLeftColor()
    }
    
    //adjust colour of timer based on how much time is left
    func timeLeftColor() -> UIColor{
        
        let timeLeft = HackathonInfo.timeLeft.time
        
        var myRed: CGFloat = 0
        var myGreen: CGFloat = 0
        let myBlue: CGFloat = 0
        
        //keep green if over 36 hours
        if timeLeft > 36 * 3600{
            myRed = 0
            myGreen = 1
        }
        //change from green to yellow in first half
        else if timeLeft <= 36 * 3600 && timeLeft > 18 * 3600{
            myRed = 1 - CGFloat((timeLeft-18*3600)/(18*3600))
            myGreen = 1
        }
        //change from yellow to red in second half
        else if timeLeft <= 18 * 3600 && timeLeft > 0{
            myGreen = CGFloat(timeLeft/(18*3600))
            myRed = 1
        }
        //keep red if less than 0
        else{
            myRed = 1
            myGreen = 0
        }
        
        return UIColor(red: myRed, green: myGreen, blue: myBlue, alpha: 1)
    }
    
    func addReminder() {
        // Create reminder by setting a local notification
        let localNotification = UILocalNotification()
        localNotification.alertTitle = "HackWestern Reminder"
        localNotification.alertBody = "do tha thing!"
        localNotification.alertAction = "ShowDetails"
        localNotification.fireDate = NSDate().dateByAddingTimeInterval(10)
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.applicationIconBadgeNumber = 1
        localNotification.category = "reminderCategory"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

}
