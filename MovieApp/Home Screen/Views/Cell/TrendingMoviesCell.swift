//
//  TrendingMoviesCell.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

class TrendingMoviesCell: UICollectionViewCell {

	//MARK: - Properties
	private let movieImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "scaryMovie")!
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 20
		return imageView
	}()

	private let imdbView = ImdbView()

	private let nameContainerView = NameContainerView()

	//MARK: - Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		setupConstraints()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Helpers

	private func configureUI() {
		self.addSubview(movieImageView)
		self.addSubview(nameContainerView)
		self.addSubview(imdbView)
	}

	private func setupConstraints() {
		movieImageView.translatesAutoresizingMaskIntoConstraints = false
		nameContainerView.translatesAutoresizingMaskIntoConstraints = false
		imdbView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			movieImageView.topAnchor.constraint(equalTo: self.topAnchor),
			movieImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			movieImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
			movieImageView.rightAnchor.constraint(equalTo: self.rightAnchor),

			nameContainerView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
			nameContainerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
			nameContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
			nameContainerView.heightAnchor.constraint(equalToConstant: 60),

			imdbView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
			imdbView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
			imdbView.heightAnchor.constraint(equalToConstant: 50),
			imdbView.widthAnchor.constraint(equalToConstant: 80)
		])
	}
}
