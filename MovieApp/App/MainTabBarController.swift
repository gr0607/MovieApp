//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by admin on 05.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		configureControllers()
		configureUI()
	}

	private func configureUI() {
		view.backgroundColor = UIColor.mainThemeColor
		tabBar.tintColor = .red
		tabBar.barTintColor = .mainThemeColor
		}

	private func configureControllers() {

		let homeVC = UINavigationController(rootViewController: HomeViewController())
		homeVC.tabBarItem.title = "Home"
		homeVC.tabBarItem.image = UIImage(named: "home_main")!



		let searchVC = UINavigationController(rootViewController: SearchViewController())
		searchVC.tabBarItem.title = "Search"
		searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")!


		self.viewControllers = [homeVC, searchVC]
	}

}
