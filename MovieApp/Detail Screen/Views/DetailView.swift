//
//  DetailView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailView: UIView {

	//MARK: - Properties

	//MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	//MARK: - Helpers Function

	private func configureUI() {
		self.backgroundColor = .yellow
	}
}
