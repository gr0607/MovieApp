//
//  DetailViewController.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

	//MARK: - Properties

	private let detailView = DetailView()

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
