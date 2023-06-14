//
//  TimeRaitngView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class TimeRatingView: UIView {

	//MARK: - Properties

	private let timeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "clock")
		imageView.tintColor = .subWhiteColor
		return imageView
	}()

	private let timeLabel: UILabel = {
		let label = UILabel()
		label.text = "152 minutes"
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = .subWhiteColor
		return label
	}()

	private let raitngImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "star.fill")
		imageView.tintColor = .subWhiteColor
		return imageView
	}()

	private let raitingLabel: UILabel = {
		let label = UILabel()
		label.text = "7.0 (IMDb)"
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = .subWhiteColor
		return label
	}()

	private lazy var timeStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [timeImageView, timeLabel])
		return stackView
	}()

	private lazy var raitingStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [raitngImageView, raitingLabel])
		return stackView
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
		self.addSubview(timeStackView)
		self.addSubview(raitingStackView)

		timeStackView.snp.makeConstraints { make in
			make.left.top.bottom.equalToSuperview()
		}

		raitingStackView.snp.makeConstraints { make in
			make.top.bottom.equalToSuperview()
			make.left.equalTo(timeStackView.snp.right).offset(20)
		}
	}
}
