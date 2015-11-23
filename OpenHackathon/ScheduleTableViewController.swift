//
//  ScheduleTableViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-19.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    //menu
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //possible days
    let days = ["November 27, 2015", "November 28, 2015", "November 29, 2015"]

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
        //format nav bar title
        self.navigationItem.title = "Schedule"
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
//        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1), atScrollPosition: .Top, animated: true)
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
        return scheduleJSON[days[section]].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! ScheduleTableViewCell
        
        //set cell delegate
        cell.delegate = self
        
        //set cell color
        if indexPath.row % 2 == 0{cell.backgroundColor = OHColor.scheduleTableViewCellBackground1}
        else{cell.backgroundColor = OHColor.scheduleTableVViewCellBackground2}
        
        //set cell tag
        cell.tag = indexPath.row
        
        //get schedule item
        let schedItem = scheduleJSON[days[indexPath.section]][indexPath.row]
                
        //get date for schedule item
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy hh:mm aa"
        let date = dateFormatter.dateFromString(days[indexPath.section]+" "+schedItem["time"].stringValue)!
        
        //set cell's sched item
        cell.scheduleItem = ScheduleItem(title: schedItem["title"].stringValue, info: schedItem["info"].stringValue, date: date, location: schedItem["location"].stringValue, toNotify: false)
        cell.populate()
        
//        if(cell.scheduleItem.toNotify == false){
//            cell.addScheduleButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
//            cell.addScheduleButton.setTitle("+ Remind Me", forState: .Normal)
//        }
//        else{
//            cell.addScheduleButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
//            cell.addScheduleButton.setTitle("+ Remove From Reminders", forState: .Normal)
//        }
        

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return days[section]
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }


   
}
