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
        homeView.delegate = self
        homeView.moviesViewModel = moviesViewModel
        moviesViewModel.fetchMovies()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
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

extension HomeViewController: HomeViewDelegate {
    func didSelectItemAt(_ IndexPath: IndexPath) {
        
        guard  let movieViewModel = moviesViewModel.getMovieViewModelByIndex(IndexPath.row) else { return }
        
        pushViewCotroller(with: movieViewModel.id)
    }
    
    func didTapLastMovie(with movieViewModel: MovieViewModel) {
        pushViewCotroller(with: movieViewModel.id)
    }
    
    func pushViewCotroller(with id: Int) {
        let detailViewController = MovieDetailViewController()
        detailViewController.id = id
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
