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
		let homeVC = createNavigationController(for: HomeViewController(), "Home", "Movie", UIImage(named: "home_main")!)
		let searchVC = createNavigationController(for: SearchViewController(), "Search", "SearchWhat", UIImage(systemName: "magnifyingglass")!)

		self.viewControllers = [homeVC, searchVC]
	}

	private func createNavigationController(for rootViewController: UIViewController, _ barTitle: String,
																					_ title: String, _ image: UIImage) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: rootViewController)
		navigationController.tabBarItem.title = barTitle
		navigationController.tabBarItem.image = image

		navigationController.navigationBar.prefersLargeTitles = true
		rootViewController.navigationItem.title = title
		return navigationController
	}
}
