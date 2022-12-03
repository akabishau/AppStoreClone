//
//  AppDelegate.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = MainTabBarVC()
		return true
	}
}

