//
//  SearchView.swift
//  MovieApp
//
//  Created by admin on 12.06.2023.
//

import UIKit
import SnapKit

class SearchView: UIView {
	private static let reuseId = "filmsReuseId"

	private let genreSegmentedControl: UISegmentedControl = {
		let segmentedControl = UISegmentedControl(items: ["Movies", "Tv Series", "Documentary", "Sport"])

		segmentedControl.selectedSegmentIndex = 0

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: UIControl.State.selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)


		//TODO:- Make .main
		segmentedControl.selectedSegmentTintColor = .mainThemeColor
		segmentedControl.backgroundColor = .mainThemeColor

		let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.mainThemeColor.cgColor, andSize: segmentedControl.bounds.size)
				segmentedControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
				segmentedControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
				segmentedControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

		let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.mainThemeColor.cgColor, andSize: CGSize(width: 1.0, height: segmentedControl.bounds.size.height))
		segmentedControl.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

		return segmentedControl
	}()

	private let filmsCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()

		layout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
		layout.minimumLineSpacing = 10
		layout.itemSize = CGSize(width: 150, height: 240)

		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return cv
	}()

	//MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		setupConstraints()
		configureFilmsCollectionView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	//MARK: - Helpers Function

	private func configureUI() {
		self.backgroundColor = .mainThemeColor

		self.addSubview(genreSegmentedControl)
		self.addSubview(filmsCollectionView)
	}

	private func setupConstraints() {
		genreSegmentedControl.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(12)
			make.left.right.equalToSuperview()
		}

		filmsCollectionView.snp.makeConstraints { make in
			make.top.equalTo(self.genreSegmentedControl.snp.bottom).offset(10)
			make.left.right.bottom.equalToSuperview()
		}
	}

	private func configureFilmsCollectionView() {
		filmsCollectionView.backgroundColor = .mainThemeColor
		filmsCollectionView.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: SearchView.reuseId)
		filmsCollectionView.dataSource = self
		filmsCollectionView.delegate = self
	}
}

//MARK: - UICollectionViewDataSource

extension SearchView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchView.reuseId, for: indexPath) as! FilmsCollectionViewCell

		return cell
	}
}

//MARK: - UICollectionViewDelegate

extension SearchView: UICollectionViewDelegate {

}

