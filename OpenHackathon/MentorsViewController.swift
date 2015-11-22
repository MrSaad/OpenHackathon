//
//  MentorsViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-11-21.
//  Copyright © 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MentorsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set webview delegate
        self.webView.delegate = self
        
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
        self.navigationItem.title = "Mentors"
        
        //format right nav bar button to refresh
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "reloadPage")
        navigationItem.rightBarButtonItem = button
        
        //format load label
        loadLabel.text = "Loading..."
        loadLabel.font = UIFont(name: "Helvetica", size: 20)
    }
    
    //reloads page content
    func reloadPage(){
        let url = NSURL (string: "http://hackwestern.com/mentors");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }

}

extension MentorsViewController: UIWebViewDelegate{
    
    //splash screen for webview loading
    func webViewDidStartLoad(webView: UIWebView) {
        self.loadLabel.hidden = false
    }
    
    //hide splash screen
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loadLabel.hidden = true
    }

}
