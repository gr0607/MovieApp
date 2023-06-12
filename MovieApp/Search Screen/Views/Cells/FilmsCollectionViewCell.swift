//
//  FilmsCollectionViewCell.swift
//  MovieApp
//
//  Created by admin on 12.06.2023.
//

import UIKit

class FilmsCollectionViewCell: UICollectionViewCell {

	//MARK: - Properties

	private let filmImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "scaryMovie")
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 15
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()

	private let filmNameLabel: UILabel = {
		let label = UILabel()
		label.text = "Scary movie"
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 18)
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

	//MARK: - Helper Function

	func configureUI() {
		self.backgroundColor = .mainThemeColor
		self.addSubview(filmImageView)
		self.addSubview(filmNameLabel)

		filmImageView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.width.equalTo(170)
			make.height.equalTo(210)

		}

		filmNameLabel.snp.makeConstraints { make in
			make.top.equalTo(filmImageView.snp.bottom)
			make.left.bottom.right.equalToSuperview()
		}
	}
}
