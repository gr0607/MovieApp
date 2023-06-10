//
//  NameContainerView.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

class NameContainerView: UIView {

	//MARK: - Properties

	private let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 25)
		label.text = "Scary movie"
		label.textColor = .white
		return label
	}()

	//MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	//MARK: - Helpers

	private func configureUI() {
		self.makeBackground()

		self.addSubview(nameLabel)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
		])
	}
}
