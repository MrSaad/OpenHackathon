//
//  HomeViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-12.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //labels
    @IBOutlet weak var countdownClock: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    //timer
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //set nav bar title
        self.navigationItem.title = "Home"
        
        //format countdown clock
        countdownClock.font = UIFont(name: "Helvetica-Light", size: 60)
        //countdown timer updates
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        //format time left label
        timeLeftLabel.textColor = UIColor.darkGrayColor()
        timeLeftLabel.font = UIFont(name: "Helvetica", size: 14)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //update the the countdown timer
    func updateTime(){
        countdownClock.text = HackathonInfo.timeLeft.hrMinSecForm
        countdownClock.textColor = OHColor.tabBarBackgroundColor
    }
    
    //adjust colour of timer based on how much time is left
    func timeLeftColor() -> UIColor{
        let timeLeft = HackathonInfo.timeLeft.timeInSeconds
        
        var myRed: CGFloat = 0
        var myGreen: CGFloat = 0
        var myBlue: CGFloat = 0
        
        //keep green if over 36 hours
        if timeLeft > 36 * 3600{
            myRed = 0
            myGreen = 1
        }
        //change from green to yellow in first half
        else if timeLeft <= 36 * 3600 && timeLeft > 18 * 3600{
            myRed = CGFloat((timeLeft-18*3600)/(18*3600))
            myGreen = 1
        }
        //change from yellow to red in second half
        else if timeLeft <= 18 * 3600{
            myGreen = 1 - CGFloat(timeLeft/(18*3600))
            myRed = 1
        }
        //keep red if less than 0
        else{
            myRed = 1
            myGreen = 0
        }
        
        return UIColor(red: myRed, green: myGreen, blue: myBlue, alpha: 1)
    }

}
