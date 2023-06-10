//
//  ContinueWatchingView.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

class ContinueWatchingView: UIView {

	//MARK: - Properties

	private let playImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "play")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private let continiueWatchingLabel: UILabel = {
		let label = UILabel()
		label.text = "Continue Watching"
		label.font = UIFont(name: "Georgia", size: 12)
		label.textColor = .subWhiteColor
		return label
	}()

	private let filmNameLabel: UILabel = {
		let label = UILabel()
		label.text = "Some Awesome movie"
		label.font = UIFont.boldSystemFont(ofSize: 16)
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

	//MARK: - UI Helpers

	private func configureUI() {
		self.makeBackground()

		self.addSubview(playImageView)
		self.addSubview(continiueWatchingLabel)
		self.addSubview(filmNameLabel)

		setupConstraints()
	}

	private func setupConstraints() {
		playImageView.translatesAutoresizingMaskIntoConstraints = false
		continiueWatchingLabel.translatesAutoresizingMaskIntoConstraints = false
		filmNameLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			playImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			playImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
			playImageView.widthAnchor.constraint(equalToConstant: 29),
			playImageView.heightAnchor.constraint(equalToConstant: 29),

			continiueWatchingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			continiueWatchingLabel.leftAnchor.constraint(equalTo: playImageView.rightAnchor, constant: 10),

			filmNameLabel.topAnchor.constraint(equalTo: continiueWatchingLabel.bottomAnchor, constant: 4),
			filmNameLabel.leftAnchor.constraint(equalTo: playImageView.rightAnchor, constant: 10)

		])
	}
}
