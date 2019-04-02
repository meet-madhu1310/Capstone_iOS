//
//  AppDelegate.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-08.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
//import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    ///For 3D Touch
    var shortcutItemToProcess: UIApplicationShortcutItem?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 20.0/255.0, green: 25.0/255.0, blue: 45.0/255.0, alpha: 2.0)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        //to show the status bar in light content because navigation is dark
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        //Tab Bar color 
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().barStyle = UIBarStyle.blackOpaque
        UITabBar.appearance().backgroundColor = UIColor(red: 20.0/255.0, green: 25.0/255.0, blue: 45.0/255.0, alpha: 1)
        
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        ///For 3D Touch
        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            shortcutItemToProcess = shortcutItem
        }
        
        return true
    }
    
//    @available (iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
    }

    /// - Tag: PerformAction
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        shortcutItemToProcess = shortcutItem
    }
    
}

