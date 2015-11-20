//
//  SponsorsTableViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-02.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit
import SwiftyJSON

class SponsorsTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let sponsorTitles = ["Gold Sponsors", "Silver Sponsors", "Bronze Sponsors"]
    let sponsorTypes = ["gold", "silver", "bronze"]
    var sponsors: JSON!

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
        //set nav bar title
        self.navigationItem.title = "Sponsors"
        
        //*** READ JSON ***
        if let path = NSBundle.mainBundle().pathForResource("SponsorData", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                sponsors = json["sponsors"]
            }
        }
        
        //testing
        print(sponsors["gold"][0])
        
    }
}

// MARK: - Table view data source
extension SponsorsTableViewController{
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sponsorTypes.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sponsorCell", forIndexPath: indexPath) as! SponsorTableViewCell
        
        //fill in stuff here
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sponsorTitles[section]
    }
}

// MARK: - Table View Delegate
extension SponsorsTableViewController{
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}
