//
//  UpdateViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-18.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load page
        reloadPage()
        
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
        self.navigationItem.title = "Updates"
        
        //format right nav bar button to refresh
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "reloadPage")
        navigationItem.rightBarButtonItem = button
    }
    
    //reloads page content
    func reloadPage(){
        let url = NSURL (string: "http://localhost:3000/updates");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }

}
