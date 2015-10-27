//
//  SponsorsTableViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-02.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class SponsorsTableViewController: UITableViewController {
    
    let sponsorTypes = ["Gold Sponsors", "Silver Sponsors", "Bronze Sponsors"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //set nav bar title
        self.navigationItem.title = "Sponsors"
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return sponsorTypes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sponsorCell", forIndexPath: indexPath) as! SponsorTableViewCell

        

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sponsorTypes[section]
    }
    

}
