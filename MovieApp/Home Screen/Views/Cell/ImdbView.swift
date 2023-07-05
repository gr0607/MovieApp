//
//  ImdbView.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

class ImdbView: UIView {

	//MARK: - Properties

	private let imdbNameLabel: UILabel = {
		let label = UILabel()
		label.text = "IMDb"
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = .white
		return label
	}()

	private let starImageView: UIImageView = {
		let iv = UIImageView()
		iv.tintColor = .yellow
		iv.image = UIImage(systemName: "star.fill")!
		return iv
	}()

	 let scoreLabel: UILabel = {
		let label = UILabel()
		label.text = "7.0"
		label.font = UIFont.systemFont(ofSize: 14)
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

	//MARK: - Lifecycle

	private func configureUI() {
		self.makeBackground()

		self.addSubview(imdbNameLabel)
		self.addSubview(starImageView)
		self.addSubview(scoreLabel)

		setupconstraints()
	}

	private func setupconstraints() {
		imdbNameLabel.translatesAutoresizingMaskIntoConstraints = false
		starImageView.translatesAutoresizingMaskIntoConstraints = false
		scoreLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imdbNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
			imdbNameLabel.heightAnchor.constraint(equalToConstant: 9),
			imdbNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
			imdbNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),

			starImageView.heightAnchor.constraint(equalToConstant: 20),
			starImageView.widthAnchor.constraint(equalToConstant: 20),
			starImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
			starImageView.topAnchor.constraint(equalTo: imdbNameLabel.bottomAnchor, constant: 4),

			scoreLabel.topAnchor.constraint(equalTo: imdbNameLabel.bottomAnchor, constant: 7),
			scoreLabel.leftAnchor.constraint(equalTo: starImageView.rightAnchor, constant: 4)
		])
	}
}
