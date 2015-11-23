//
//  InfoViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-23.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var linkButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set toggle menu button
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        //set navigation bar title
        self.navigationItem.title = "Additional Info"
        
        //format view
        self.view.backgroundColor = UIColor.blackColor()
        
        //format buttons
        for i in 0...2{
            linkButtons[i].tag = i
            linkButtons[i].backgroundColor = HackWesternColor.deepPurple500
            linkButtons[i].layer.cornerRadius = 10
        }
        
    }

    @IBAction func buttonClicked(sender: UIButton) {
        
        switch sender.tag{
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://hackwestern.com")!)
        case 1:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://hackwestern.com/devpost-page-link")!)
            
        case 2:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://hackwestern.com/showcase")!)
        default: break;
        }
        
    }

}
