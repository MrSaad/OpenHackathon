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
    let titles = ["Home", "Schedule", "Updates", "Maps", "Mentors", "Sponsors", "Info"]
    
    //image handles
    let imageHandles = ["home", "schedule", "updates", "maps", "mentors", "sponsors", "info"]
    
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
        
//        view.backgroundColor = UIColor(red: 128/255, green: 127/255, blue: 131/255, alpha: 1)
        view.backgroundColor = OHColor.menuCellUnselectedColor
        
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
        cell.backgroundColor = UIColor.whiteColor()
        cell.titleLabel.text = titles[indexPath.row]
        cell.iconImage.image = UIImage(named: imageHandles[indexPath.row])
        cell.iconImage.image = cell.iconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
    
        return cell

    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let currCell = cell as! MenuTableViewCell
        
        if HackathonInfo.currentPageInView == Page(rawValue: indexPath.row){
            currCell.backgroundColor = OHColor.menuCellSelectedColor
            currCell.iconImage.tintColor = HackWesternColor.deepPurple500
            currCell.titleLabel.textColor = HackWesternColor.deepPurple500
        }
        else{
            cell.backgroundColor = OHColor.menuCellUnselectedColor
            currCell.iconImage.tintColor = HackWesternColor.darkGrayColor()
            currCell.titleLabel.textColor = HackWesternColor.darkGrayColor()
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
        case 4: performSegueWithIdentifier("showMentorsSegue", sender: self)
        case 5: performSegueWithIdentifier("showSponsorsSegue", sender: self)
        case 6: performSegueWithIdentifier("showInfoSegue", sender: self)
        default: break;
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50
    }

}
