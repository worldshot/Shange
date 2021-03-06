//
//  AppDelegate.swift
//  Shange
//
//  Created by Gal Blank on 10/22/15.
//  Copyright © 2015 Gal Blank. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialViewController :UIViewController?
    var rootNavController :UINavigationController!
    var menuNavController :UINavigationController!
    var menuVC :MenuViewController!
    
    
    var menuButton :UIButton!
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController  = ViewController()
        rootNavController = UINavigationController(rootViewController: initialViewController!)
        rootNavController.view.backgroundColor = UIColor.clearColor()
        
        
        /*menuVC = MenuViewController()
        menuNavController = UINavigationController(rootViewController: menuVC!)
        menuNavController.view.backgroundColor = UIColor.clearColor()*/
        
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        window!.rootViewController = rootNavController
        window!.makeKeyAndVisible()
        
        return true
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
    
    func showMenuButton()
    {
        if(menuButton == nil){
            menuButton = UIButton(type: UIButtonType.Custom)
            menuButton.frame = CGRect(x: self.window!.frame.size.width - 80, y: self.window!.frame.size.height - 80, width: 60, height: 60);
            menuButton.addTarget(self, action:nil, forControlEvents: UIControlEvents.TouchUpInside)
            menuButton.setBackgroundImage(UIImage(named: "menubutton"), forState: UIControlState.Normal)
            self.window!.addSubview(menuButton)
            
        }
        menuButton.hidden = false;
    }
    
    func hideMenuButton()
    {
        if(menuButton != nil){
            menuButton.hidden = true;
        }
    }
    
    
}

