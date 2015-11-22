//
//  AppDelegate.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-08-11.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit
import Parse
import SwiftyJSON

var complimentsJSON: JSON!
var scheduleJSON: JSON!
var notifJSON: JSON!
var notifDict = [String: Bool]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(nil, forKey: "schedule_stored_data")
        defaults.setObject(nil, forKey: "notif_stored_data")
        if(defaults.objectForKey("schedule_stored_data") == nil){
            
            //load compliments
            var path = NSBundle.mainBundle().pathForResource("compliments", ofType: "json")!
            var data = NSData(contentsOfFile: path)!
            complimentsJSON = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            
            //load schedule
            path = NSBundle.mainBundle().pathForResource("schedule_info", ofType: "json")!
            data = NSData(contentsOfFile: path)!
            scheduleJSON = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            defaults.setObject(scheduleJSON.rawString()!, forKey: "schedule_stored_data")
            
            //load notifications
            path = NSBundle.mainBundle().pathForResource("notifications", ofType: "json")!
            data = NSData(contentsOfFile: path)!
            notifJSON = JSON(data: data)
            defaults.setObject(notifJSON.rawString()!, forKey: "notif_stored_data")
            
            for (key, object) in notifJSON {
                notifDict[key] = object.boolValue
            }
        }
        else{
            
            //load schedule
            var str = defaults.objectForKey("schedule_stored_data")
            var dataFromStr = str!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
            scheduleJSON = JSON(data: dataFromStr)
            
            //load notifations
            str = defaults.objectForKey("notif_stored_data")
            dataFromStr = str!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
            notifJSON = JSON(data: dataFromStr)
            notifDict = notifJSON.dictionaryObject as! [String: Bool]
            
        }
    
        
        Parse.setApplicationId("mboI7L7M7uPlSSdCBUPDCWQC3NLqDORPyPQyuOWE",
            clientKey: "5jPMH4NIUhGQUCGS4XTRl3h8Fh2PKj3TBSMltteG")
        
        // Register for Push Notitications
        if application.applicationState != UIApplicationState.Background {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
            
            let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
            var pushPayload = false
            if let options = launchOptions {
                pushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil
                // Check if there are any local notification objects.
                if let notification = (options as NSDictionary).objectForKey("UIApplicationLaunchOptionsLocalNotificationKey") as? UILocalNotification {
                    // Handle the notification action on opening. Like updating a table or showing an alert.
                    UIAlertView(title: notification.alertTitle, message: notification.alertBody, delegate: nil, cancelButtonTitle: "OK").show()
                }
            }
            if (preBackgroundPush || oldPushHandlerOnly || pushPayload) {
                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
            }
        }
        if application.respondsToSelector("registerUserNotificationSettings:") {
            
            let eventReminderCategory = UIMutableUserNotificationCategory()
            eventReminderCategory.identifier = "reminderCategory"
            
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: Set(arrayLiteral: eventReminderCategory))
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
            UIApplication.sharedApplication().registerForRemoteNotifications()
        } else {
//            let types = UIRemoteNotificationType.Badge | UIRemoteNotificationType.Alert | UIRemoteNotificationType.Sound
//            application.registerForRemoteNotificationTypes(types)
        }
        
        //set push notifications
//        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
//        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        //set page controller indicators
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.darkGrayColor()
        pageControl.backgroundColor = UIColor.whiteColor()
        
        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        // Point for handling the local notification when the app is open.
        // Showing reminder details in an alertview
        UIAlertView(title: notification.alertTitle, message: notification.alertBody, delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        // Point for handling the local notification Action. Provided alongside creating the notification.
        if identifier == "ShowDetails" {
            // Showing reminder details in an alertview
            UIAlertView(title: notification.alertTitle, message: notification.alertBody, delegate: nil, cancelButtonTitle: "OK").show()
        }
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        if error.code == 3010 {
            print("Push notifications are not supported in the iOS Simulator.")
        } else {
            print("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PFPush.handlePush(userInfo)
        if application.applicationState == UIApplicationState.Inactive {
            PFAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

