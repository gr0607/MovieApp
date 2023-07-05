//
//  NameContainerView.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

class NameContainerView: UIView {

	//MARK: - Properties

	public let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 25)
		label.text = "Scary movie"
		label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.minimumScaleFactor = 0.2
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
			nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
			nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
		])
	}
}
