//
//  SearchView.swift
//  MovieApp
//
//  Created by admin on 12.06.2023.
//

import UIKit
import SnapKit
import Combine

protocol SearchViewDelegate: AnyObject {
    func selectFilmAtIndexPath(_ indexPath: IndexPath)
}

class SearchView: UIView {
    
    private var canclellable = Set<AnyCancellable>()
    
    weak var delegate: SearchViewDelegate?
    
	private static let reuseId = "filmsReuseId"
    var searchViewModel: SearchViewModel? {
        didSet {
            bindTo()
        }
    }

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
		self.addSubview(filmsCollectionView)
	}

	private func setupConstraints() {
		filmsCollectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
		}
	}

	private func configureFilmsCollectionView() {
		filmsCollectionView.backgroundColor = .mainThemeColor
		filmsCollectionView.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: SearchView.reuseId)
		filmsCollectionView.dataSource = self
		filmsCollectionView.delegate = self
	}
    
    private func bindTo() {
        guard let searchViewModel = searchViewModel else { return }
        searchViewModel.$moviesStore
            .receive(on: DispatchQueue.main)
            .sink {[weak self] movies in
                self?.filmsCollectionView.reloadData()
            }
            .store(in: &canclellable)
    }
    
}

//MARK: - UICollectionViewDataSource

extension SearchView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchViewModel?.getNumberOfRows() ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchView.reuseId, for: indexPath) as? FilmsCollectionViewCell,
              let movieViewModel = searchViewModel?.getMoviewVieModelByIndex(indexPath.row)
        else { return UICollectionViewCell()}
        
        cell.configureCell(with: movieViewModel)
        
		return cell
	}
}

//MARK: - UICollectionViewDelegate

extension SearchView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectFilmAtIndexPath(indexPath)
    }
}

