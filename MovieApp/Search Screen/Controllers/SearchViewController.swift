//
//  SearchViewController.swift
//  MovieApp
//
//  Created by admin on 05.06.2023.
//

import UIKit

class SearchViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.title = "Find Movies\nPronn"
		navigationController?.navigationBar.prefersLargeTitles = true
		view.backgroundColor = .mainThemeColor
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupNavigationBarColor()
	}



	private func setupNavigationBarColor() {
		for view in self.navigationController?.navigationBar.subviews ?? [] {
			 let subviews = view.subviews
			 if subviews.count > 0, let label = subviews[0] as? UILabel {
				label.textColor = .white
			 }
		}
	}
}
