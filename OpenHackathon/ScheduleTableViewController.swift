//
//  ScheduleTableViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-19.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    let days = ["Friday", "Saturday", "Sunday"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //format nav bar title
        self.navigationItem.title = "Schedule"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! ScheduleTableViewCell
        
        //set cell delegate
        cell.delegate = self
        
        //set cell color
        if indexPath.row % 2 == 0{cell.backgroundColor = OHColor.scheduleTableViewCellBackground1}
        else{cell.backgroundColor = OHColor.scheduleTableVViewCellBackground2}
        
        //set cell text properties
        cell.tag = indexPath.section*100 + indexPath.row
        
        if(!cell.addedToSchedule){
            cell.addScheduleButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            cell.addScheduleButton.setTitle("+ Add to Schedule", forState: .Normal)
        }
        else{
            cell.addScheduleButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
            cell.addScheduleButton.setTitle("+ Remove From Schedule", forState: .Normal)
        }
        

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return days[section]
    }


   
}
