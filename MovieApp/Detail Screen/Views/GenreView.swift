//
//  GenreView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class GenreView: UIView {

	//MARK: - Properties

	private let genreLabel: UILabel = {
		let label = UILabel()
		label.text = "Genre"
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .white
		return label
	}()

	private lazy var  subGenreLabelMain: UILabel = {
		let label = UILabel()
		label.text = "Action"
		label.font = UIFont.systemFont(ofSize: 14)
		label.layer.cornerRadius = 10
		label.clipsToBounds = true
		label.textAlignment = .center
		label.backgroundColor = .black
		label.textColor = .subWhiteColor
		return label
	}()

	private lazy var  subGenreLabelSecond: UILabel = {
		let label = UILabel()
		label.text = "Sci-Fi"
		label.font = UIFont.systemFont(ofSize: 14)
		label.layer.cornerRadius = 10
		label.clipsToBounds = true
		label.textAlignment = .center
		label.backgroundColor = .black
		label.textColor = .subWhiteColor
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

	//MARK: - Helpers Function

	private func configureUI() {
		self.backgroundColor = .mainThemeColor

		let stackView = UIStackView(arrangedSubviews: [subGenreLabelMain, subGenreLabelSecond])
		stackView.spacing = 5
		self.addSubview(genreLabel)
		self.addSubview(stackView)

		genreLabel.snp.makeConstraints { make in
			make.top.left.equalToSuperview()
		}

		subGenreLabelMain.snp.makeConstraints { make in
			make.width.equalTo(70)
		}

		subGenreLabelSecond.snp.makeConstraints { make in
			make.width.equalTo(70)
		}

		stackView.snp.makeConstraints { make in
			make.left.equalToSuperview()
			make.top.equalTo(genreLabel.snp.bottom).offset(6)
		}
	}
}
