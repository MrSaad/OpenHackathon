//
//  HomeViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-12.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
