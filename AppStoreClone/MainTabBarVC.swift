//
//  MainTabBarVC.swift
//  AppStoreClone
//
//  Created by Aleksey Kabishau on 12/3/22.
//

import UIKit

class MainTabBarVC: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white

		viewControllers = [
			createNavController(viewController: UIViewController(), title: "Apps", imageName: "house"),
			createNavController(viewController: UIViewController(), title: "Search", imageName: "magnifyingglass")
		]
	}
	
	
	fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
		
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.tabBarItem.title = title
		navigationController.tabBarItem.image = UIImage(systemName: imageName)
		navigationController.navigationBar.prefersLargeTitles = true
		
		viewController.navigationItem.title = title
		viewController.view.backgroundColor = .clear
		
		
		return navigationController
		
	}
}
