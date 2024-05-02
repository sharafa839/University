//
//  AppDelegate.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

              let universitiesListViewController = UniversitiesListRouter.createModule()

               /* Initiating instance of ui-navigation-controller with view-controller */
               let navigationController = UINavigationController()
               navigationController.viewControllers = [universitiesListViewController]

               /* Setting up the root view-controller as ui-navigation-controller */
               window = UIWindow(frame: UIScreen.main.bounds)
               window?.rootViewController = navigationController
               window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

}

