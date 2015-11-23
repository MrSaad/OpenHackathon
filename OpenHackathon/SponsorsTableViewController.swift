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
    
    let sponsorTitles = ["Partners", "Platinum Sponsors", "Gold Sponsors", "Silver Sponsors", "Bronze Sponsors"]
    let sponsorTypes = ["partners", "platinum", "gold", "silver", "bronze"]
    var sponsors: JSON!
    var currSponsor: Sponsor!

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

        //set nav bar title
        self.navigationItem.title = "Sponsors"
        
        //*** READ JSON ***!
        let path = NSBundle.mainBundle().pathForResource("SponsorData", ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        sponsors = json["sponsors"]

        
    }
}

// MARK: - Table view data source
extension SponsorsTableViewController{
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sponsorTypes.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (sponsors["\(sponsorTypes[section])"].count-1)/5 + 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sponsorCell", forIndexPath: indexPath) as! SponsorTableViewCell
        
        for i in 0...4{
            if(sponsors["\(sponsorTypes[indexPath.section])"].count > indexPath.row*5+i){
                
                //set image and tag
                cell.imageViews[i].image = UIImage(named: sponsors["\(sponsorTypes[indexPath.section])"][indexPath.row*5+i]["logo"].stringValue)
                cell.imageViews[i].tag = indexPath.section*100 + indexPath.row*5+i
                
                //set tap gesture
                cell.imageViews[i].userInteractionEnabled = true
                let tapGesture = UITapGestureRecognizer(target: self, action: "sponsorImageTapped:")
                tapGesture.numberOfTapsRequired = 1
                cell.imageViews[i].addGestureRecognizer(tapGesture)
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sponsorTitles[section]
    }
    
    func sponsorImageTapped(sender: UITapGestureRecognizer){
        let view = sender.view!
        let sponsorFromJSON = sponsors["\(sponsorTypes[view.tag/100])"][view.tag%100]
        UIApplication.sharedApplication().openURL(NSURL(string: sponsorFromJSON["website"].stringValue)!)
        
//        currSponsor = Sponsor(name: sponsorFromJSON["name"].stringValue, imageHandle: sponsorFromJSON["logo"].stringValue,
//            info: sponsorFromJSON["info"].stringValue, website: "https://google.com")
//        performSegueWithIdentifier("showSponsorInfoSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSponsorInfoSegue"{
            if let vc = segue.destinationViewController as? SponsorInfoViewController{
                vc.sponsor = currSponsor
            }
        }
    }
    
    
}

// MARK: - Table View Delegate
extension SponsorsTableViewController{
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
}
