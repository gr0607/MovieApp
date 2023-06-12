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
		navigationController?.navigationBar.barTintColor = UIColor.green
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
		navigationItem.title = "BBB"
		view.backgroundColor = .blue
	}
}
