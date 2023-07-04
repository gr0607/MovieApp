//
//  HomeView.swift
//  MovieApp
//
//  Created by admin on 08.06.2023.
//

import UIKit

class HomeView: UIView{
	private static let moviesReuseID = "moviesReuseID"

	//MARK: - Properties
     var moviesViewModel: MoviesViewModel?

	private let mainLabel: UILabel = {
		let label = UILabel()

		var mutableString = NSMutableAttributedString(string: "Movies Everywhere", attributes: [NSAttributedString.Key.font :UIFont(name: "Georgia", size: 30.0)!])
		mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:9))
		mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:7,length:10))


		label.attributedText = mutableString
		label.backgroundColor = .mainThemeColor
		return label
	}()

	private let mainImage: UIImageView = {
		let mainImage = UIImageView()
		mainImage.image = UIImage(named: "homeFilm")
		mainImage.clipsToBounds = true
		mainImage.layer.cornerRadius = 16
		mainImage.contentMode = .scaleAspectFill

		return mainImage
	}()

	private let continueWatchingView = ContinueWatchingView()

	private let trendingLabel: UILabel = {
		let label = UILabel()
		label.text = "Trending"
		label.font = UIFont(name: "Georgia", size: 27)
		label.textColor = .white
		label.backgroundColor = .mainThemeColor
		return label
	}()

	private let trendingMoviewCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.minimumLineSpacing = 30
		layout.itemSize = CGSize(width: 260, height: 390)
		layout.scrollDirection = .horizontal

		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return cv
	}()

	//MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		setupConstraints()
		setupTrendingMoviesCollectionView()
		trendingMoviewCollectionView.dataSource = self
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Helper Functions

	private func configureUI() {
		self.backgroundColor = .mainThemeColor
		self.addSubview(mainLabel)
		self.addSubview(mainImage)
		self.addSubview(continueWatchingView)
		self.addSubview(trendingLabel)
		self.addSubview(trendingMoviewCollectionView)
	}

	private func setupConstraints() {
		mainLabel.translatesAutoresizingMaskIntoConstraints = false
		mainImage.translatesAutoresizingMaskIntoConstraints = false
		continueWatchingView.translatesAutoresizingMaskIntoConstraints = false
		trendingLabel.translatesAutoresizingMaskIntoConstraints = false
		trendingMoviewCollectionView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			mainLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 34),
			mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
			mainLabel.widthAnchor.constraint(equalToConstant: 300),
			mainLabel.heightAnchor.constraint(equalToConstant: 29),

			mainImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
			mainImage.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 24),
			mainImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
			mainImage.heightAnchor.constraint(equalToConstant: 204),

			continueWatchingView.bottomAnchor.constraint(equalTo: self.mainImage.bottomAnchor, constant: -10),
			continueWatchingView.leftAnchor.constraint(equalTo: self.mainImage.leftAnchor, constant: 10),
			continueWatchingView.heightAnchor.constraint(equalToConstant: 55),
			continueWatchingView.widthAnchor.constraint(equalToConstant: 250),

			trendingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
			trendingLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 24),
			trendingLabel.widthAnchor.constraint(equalToConstant: 120),
			trendingLabel.heightAnchor.constraint(equalToConstant: 29),

			trendingMoviewCollectionView.topAnchor.constraint(equalTo: self.trendingLabel.bottomAnchor, constant: 8),
			trendingMoviewCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
			trendingMoviewCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
			trendingMoviewCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	private func setupTrendingMoviesCollectionView() {
		trendingMoviewCollectionView.backgroundColor = .mainThemeColor
		trendingMoviewCollectionView.dataSource = self
		trendingMoviewCollectionView.register(TrendingMoviesCell.self, forCellWithReuseIdentifier: HomeView.moviesReuseID)
	}
}

extension HomeView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel?.getCountOfMovies() ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeView.moviesReuseID, for: indexPath)
		return cell
	}
}
