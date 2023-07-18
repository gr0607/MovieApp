//
//  DetailViewController.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {

	//MARK: - Properties
    
    private let movieDetailViewModel = MovieDetailViewModel()
    var id: Int?
	private let detailView = DetailScreenView()

	//MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
        movieDetailViewModel.fetchMovieDetailWith(id: id)
        navigationItem.largeTitleDisplayMode = .never
	}
    

	//MARK: - Helpers function

	private func configureUI() {
		self.view.addSubview(detailView)
        detailView.moviewDetailViewModel = movieDetailViewModel

		detailView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
		}
	}
    
}
