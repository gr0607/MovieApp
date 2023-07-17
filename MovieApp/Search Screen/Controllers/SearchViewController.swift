//
//  SearchViewController.swift
//  MovieApp
//
//  Created by admin on 05.06.2023.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

	private let searchView = SearchView()
    private let searchViewModel = SearchViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
        searchView.searchViewModel = searchViewModel
	}
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

	private func setupUI() {
		setupNavigationBar()
		setupSearchController()
        searchView.delegate = self
		self.view.addSubview(searchView)
		searchView.snp.makeConstraints { make in
			make.top.equalTo(self.view.safeAreaLayoutGuide)
			make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
		}
	}

	private func setupNavigationBar() {
		navigationItem.title = "Search"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
		navigationController?.navigationBar.barTintColor = .mainThemeColor
		view.backgroundColor = .mainThemeColor
	}

	private func setupSearchController() {
		let search = UISearchController(searchResultsController: nil)
		search.searchResultsUpdater = self
		search.obscuresBackgroundDuringPresentation = false
		search.searchBar.placeholder = "Sherlock Holmes"
        search.searchBar.scopeButtonTitles = Genres.allCases.map{ $0.rawValue}
        search.searchBar.delegate = self
        definesPresentationContext = true
		navigationItem.searchController = search
	}
}

extension SearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        if text.isEmpty { searchViewModel.searchText = "A"} else {
            searchViewModel.searchText = text
        }
        
	}
}

extension SearchViewController: SearchViewDelegate {
    func selectFilmAtIndexPath(_ indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let movieViewModel = searchViewModel.getMoviewVieModelByIndex(indexPath.row)
        
        detailViewController.movieViewModel = movieViewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            searchViewModel.genreId = 28
        case 1:
            searchViewModel.genreId = 16
        case 2:
            searchViewModel.genreId = 27
        case 3:
            searchViewModel.genreId = 99
        default:
            break
        }
    }
}
