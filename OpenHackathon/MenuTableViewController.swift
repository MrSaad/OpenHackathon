//
//  MenuTableViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-08.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

//    @IBOutlet var cells: [UITableViewCell]!
    
    //titles
    let titles = ["Home", "Schedule", "Updates", "Maps", "Sponsors"]
    
    //image handles
    let imageHandles = ["home", "schedule", "updates", "maps", "sponsors"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //format nav bar title
        self.navigationItem.title = "Navigation"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuTableViewCell
        
        //set titles and images
        cell.titleLabel.text = titles[indexPath.row]
        cell.iconImage.image = UIImage(named: imageHandles[indexPath.row])
    
        return cell

    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if HackathonInfo.currentPageInView == Page(rawValue: indexPath.row){
            cell.backgroundColor = OHColor.menuCellSelectedColor
        }
        else{
            cell.backgroundColor = OHColor.menuCellUnselectedColor
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //set new view
        HackathonInfo.currentPageInView = Page(rawValue: indexPath.row)!
        
        self.tableView.reloadData()
        
        //go to new view
        switch indexPath.row{
        case 0: performSegueWithIdentifier("showHomeSegue", sender: self)
        case 1: performSegueWithIdentifier("showScheduleSegue", sender: self)
        case 2: performSegueWithIdentifier("showUpdatesSegue", sender: self)
        case 3: performSegueWithIdentifier("showMapsSegue", sender: self)
        case 4: performSegueWithIdentifier("showSponsorsSegue", sender: self)
        default: break;
        }
        
    }

}
