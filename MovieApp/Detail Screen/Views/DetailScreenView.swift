//
//  DetailView.swift
//  MovieApp
//
//  Created by admin on 13.06.2023.
//

import UIKit

class DetailView: UIView {

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

		self.addSubview(filmImageView)
		self.filmImageView.addSubview(playButton)
		

		setupConstraints()
	}

	private func setupConstraints() {
		filmImageView.snp.makeConstraints { make in
		//	make.top.equalTo(self.safeAreaLayoutGuide)
			make.top.left.right.equalToSuperview()
			make.height.equalTo(350)
		}

		playButton.snp.makeConstraints { make in
			make.center.equalToSuperview()
			make.height.width.equalTo(64)
		}

	}
}
