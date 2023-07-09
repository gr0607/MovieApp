//
//  DetailViewController.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

	//MARK: - Properties
    var movieViewModel: MovieViewModel? {
        didSet {
            print("DETAILVIEWCONTROLLER", movieViewModel?.name)
        }
    }

	private let detailView = DetailScreenView()

	//MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}

	//MARK: - Helpers function

	private func configureUI() {
		self.view.addSubview(detailView)

		detailView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}
