//
//  ContinueWatchingView.swift
//  MovieApp
//
//  Created by admin on 10.06.2023.
//

import UIKit

protocol ContinueWatchingViewDelegate: AnyObject {
    func didTapLastMovie()
}

class ContinueWatchingView: UIView {

	//MARK: - Properties
    weak var delegate: ContinueWatchingViewDelegate?
    
	 private let playImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "Play-1")
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

	 let filmNameLabel: UILabel = {
		let label = UILabel()
		label.text = "Some Awesome movie"
		label.font = UIFont.boldSystemFont(ofSize: 14)
		label.textColor = .white
        label.numberOfLines = 0
         label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.minimumScaleFactor = 0.2
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gestureTap))
        
		self.makeBackground()
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
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
			filmNameLabel.leftAnchor.constraint(equalTo: playImageView.rightAnchor, constant: 10),
            filmNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            filmNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
		])
	}
    
     @objc func gestureTap() {
         delegate?.didTapLastMovie()
    }
}
