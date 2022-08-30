//
//  MainViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import UIKit

class MainViewController: UIViewController {

    var rootPageViewController: RootPageViewController!
//    lazy var searchController: UISearchController = {
//        let s = UISearchController(searchResultsController: nil)
//
//        s.searchResultsUpdater = self
//
//        s.obscuresBackgroundDuringPresentation = false
//        s.searchBar.placeholder = "Search Drinks..."
//        s.searchBar.sizeToFit()
//        s.searchBar.searchBarStyle = .prominent
//
//        return s
//    }()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.searchController = searchController
//        initSearchController()
    }
    
    func initSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageViewController = destination
        }
    }

}


extension MainViewController: RootPageProtocol {
    func currentPage(_ index: Int) {
        print("Current Page: ", index)
    }
}


extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        print(text)
    }
}
