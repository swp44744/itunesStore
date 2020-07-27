//
//  AppDelegate.swift
//  demo
//
//  Created by Swapnil Raut on 7/24/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // setup a window and a flow layout for collection view controller to skip storyboards
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.tintColor = UIColor.white

        let flowLayout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: flowLayout)
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationViewController

        return true
    }


}

