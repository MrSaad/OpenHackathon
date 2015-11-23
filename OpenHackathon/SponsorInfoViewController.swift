//
//  SponsorInfoViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-22.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class SponsorInfoViewController: UIViewController {
    
    var sponsor: Sponsor!

    override func viewDidLoad() {
        super.viewDidLoad()

        //format nav bar title
        self.navigationController?.navigationBar.tintColor = OHColor.navBarTextColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : OHColor.navBarTextColor]
        //set nav bar title
        self.navigationItem.title = sponsor.name
    }

}
