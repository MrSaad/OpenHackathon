//
//  MapsViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-19.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //format nav bar colour
        self.navigationController?.navigationBar.barTintColor = OHColor.navBarBackgroundColor
        self.navigationController?.navigationBar.translucent = false
        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //set nav bar title
        self.navigationItem.title = "Maps"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
