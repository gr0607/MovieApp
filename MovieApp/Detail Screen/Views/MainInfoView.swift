//
//  MainInfoView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class MainInfoView: UIView {

	//MARK: - Properties

	private let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Star Wars: The Last Jedi"
		label.font = UIFont.boldSystemFont(ofSize: 28)
		label.textColor = .white
		return label
	}()

	private let timeRatingView = TimeRatingView()

	//MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	//MARK: - Helpers

	func configureUI() {
		self.backgroundColor = .mainThemeColor
		self.addSubview(nameLabel)
		self.addSubview(timeRatingView)

		nameLabel.snp.makeConstraints { make in
			make.top.left.right.equalToSuperview()
		}

		timeRatingView.snp.makeConstraints { make in
			make.left.right.equalToSuperview()
			make.top.equalTo(nameLabel.snp.bottom).offset(4)
		}
	}
}
