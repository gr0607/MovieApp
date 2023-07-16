//
//  AboutView.swift
//  MovieApp
//
//  Created by admin on 14.06.2023.
//

import UIKit

class AboutView: UIView {

	//MARK: - Properties

	private let aboutNameLabel: UILabel = {
		let label = UILabel()
		label.text = "About"
		label.font = UIFont.boldSystemFont(ofSize: 22)
		label.textColor = .white
		//label.backgroundColor = .green
		return label
	}()

	private let aboutTextLabel: UILabel = {
		let label = UILabel()
		label.text = "Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn.."
		label.textColor = .subWhiteColor
		label.numberOfLines = 1
		label.font = UIFont.systemFont(ofSize: 15)
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

		self.addSubview(aboutNameLabel)
		self.addSubview(aboutTextLabel)

		aboutNameLabel.snp.makeConstraints { make in
			make.left.top.equalToSuperview()
		}

		aboutTextLabel.snp.makeConstraints { make in
			make.left.right.equalToSuperview()
			make.top.equalTo(aboutNameLabel.snp.bottom).offset(10)
		}

	}
}
