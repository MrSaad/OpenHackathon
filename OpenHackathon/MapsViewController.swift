//
//  MapsViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-19.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {

    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
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
        
        //set up the page view controller information
        self.pageTitles = NSArray(objects: "Canada", "UWO", "Maze")
        self.pageImages = NSArray(objects: "canada", "map", "maze")
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapsPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let startVC = self.viewControllerAtIndex(0) as MapsContentViewController
        
        let viewControllers = NSArray(object: startVC) as [AnyObject]
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
    }
    
    func viewControllerAtIndex(index: Int) -> MapsContentViewController{
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return MapsContentViewController()
        }
        
        let vc: MapsContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapsContentViewController") as! MapsContentViewController
        
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index

        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MapsViewController: UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        let vc = viewController as! MapsContentViewController
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound){
            return nil
        }
        index--
        
        return self.viewControllerAtIndex(index)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! MapsContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound){
            return nil
        }
        index++
        
        if (index == self.pageTitles.count){
            return nil
            
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int{

        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        
        return 0
    }
    
}