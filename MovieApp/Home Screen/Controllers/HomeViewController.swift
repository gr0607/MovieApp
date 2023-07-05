//
//  HomeViewController.swift
//  MovieApp
//
//  Created by admin on 05.06.2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

	private let homeView = HomeView()
    private let moviesViewModel = MoviesViewModel()
  

	override func viewDidLoad() {
		super.viewDidLoad()
		configreUI()
        homeView.moviesViewModel = moviesViewModel
        moviesViewModel.fetchMovies()
	}

	func configreUI() {
		view.backgroundColor = .mainThemeColor
		
		navigationController?.navigationBar.isHidden = true
		view.addSubview(homeView)
		homeView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
    
   
}
