//
//  AppDelegate.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

// PLEASE USE IPHONE XS Simulator and layout for best results!!!

// ADDITIONAL INFO:
// login credentials for testing:
// user - test@test.com
// pw - testing
// feel free to make your own testing user with a new email and password

// WARNING: The AutoLayout was not cooperating with me at all and it was making my app into a complete mess so I took off all constraints. The app looks best in IPHONE XS format. I plan on getting help with the autolayout first thing on Friday, our first full work day.

// Currently the favorite players page is a total work in progress. My plan is to add favorited players to an array, which will then display the list of favorited players to a logged-in user in a table view in the ViewController that currently just says "You are logged in".

// As far as the compare page goes, the Neural Net is currently predicting about 3.5 points off the correct score, so it is still being tweaked and therefore the server is not up for me to make API calls too yet but it is close. Since I will be able to format the JSONs myself, I feel confident in my abilities to take information from the Neural Net server apis and use them for the compare page pictures, scores, and search results. It will be very similar to how I've done the ranked list of players from fantasydata.com so I am confident I can get this done, I'm sorry for having no server to make a call too now but I definitely feel I've learned what I need to integrate the API when it is ready to be called.

// I plan on working on the search feature next, as it is a big part of my app, so that I can actually filter using the settings page I have currently set up. After this I want to add more log-in functionality using the Firebase Login UI features. Finally, I plan on fixing up my UI, finishing up my logo, and polishing my app.

// PS. the logo is totally ripped off from a different companies start/sit its only being used as a placeholder for now, I am currently working on an original logo.



import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

