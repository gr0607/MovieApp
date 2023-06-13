//
//  DetailView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailScreenView: UIView {

	//MARK: - Properties
	private let filmImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "scaryMovie")
		imageView.clipsToBounds = true
		imageView.contentMode = .redraw
		imageView.contentMode = .top
		imageView.contentMode = .scaleToFill
		return imageView
	}()

	private let playButton: UIButton = {
		let playButton = UIButton()
		let image = UIImage(named: "Play-1")
		playButton.setBackgroundImage(image, for: .normal)
	//	playButton.setImage(image, for: .normal)
		return playButton
	}()

	private let mainInfoView = MainInfoView()
	private let mainSeparatorView = UIView()

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
		self.backgroundColor = .green
		mainSeparatorView.backgroundColor = .separatorViewColor

		self.addSubview(filmImageView)
		self.filmImageView.addSubview(playButton)
		self.addSubview(mainInfoView)
		self.addSubview(mainSeparatorView)
		

		setupConstraints()
	}

	private func setupConstraints() {
		filmImageView.snp.makeConstraints { make in
			make.top.left.right.equalToSuperview()
			make.height.equalTo(350)
		}

		playButton.snp.makeConstraints { make in
			make.center.equalToSuperview()
			make.height.width.equalTo(64)
		}

		mainInfoView.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(12)
			make.right.equalToSuperview().offset(-12)
			make.top.equalTo(filmImageView.snp.bottom).offset(12)
			make.height.equalTo(60)
		}

		mainSeparatorView.snp.makeConstraints { make in
			make.height.equalTo(1)
			make.left.equalToSuperview().offset(12)
			make.right.equalToSuperview().offset(-12)
			make.top.equalTo(mainInfoView.snp.bottom).offset(8)
		}

	}
}
