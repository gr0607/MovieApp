//
//  DetailViewController.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

	//MARK: - Properties
   
	private let detailView = DetailScreenView()

	//MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
        navigationItem.largeTitleDisplayMode = .never
	}

	//MARK: - Helpers function

	private func configureUI() {
		self.view.addSubview(detailView)

		detailView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
		}
	}
}
