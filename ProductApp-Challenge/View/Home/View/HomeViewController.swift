//
//  HomeViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    lazy var presenter = HomePresenter(delegate: self)
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

    let searchCon = UISearchController()
    
    @IBOutlet weak var tableViewProducts: UITableView!
    @IBOutlet weak var searchController: UISearchBar!
    
    var drinksList: [[Drinks.ResultDrinks]] = []
    var filteredList: [[Drinks.ResultDrinks]] = []
//    var repository = RepositoryApi()
    var serviceTest = ServiceTest()
//    var apiRest = ApiRestService()
    
    var checkSearchBar: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ProductApp"
        
        ConfigTableView()
        
        filteredList = drinksList

        initSearchController()
        
        
//        navigationController?.popToRootViewController(animated: true)
//        bodyLabel.text = drinksList.first?.strDrink
        serviceTest.ServiceApiTest()
        Task {
            await presenter.getTextList()
        }
    }
    

    func ConfigTableView() {
        tableViewProducts.delegate = self
        tableViewProducts.dataSource = self
        tableViewProducts.register(UINib(nibName: ProductViewCell.kId, bundle: nil), forCellReuseIdentifier: ProductViewCell.kId)
        tableViewProducts.reloadData()
        tableViewProducts.separatorColor = .clear
        
    }
    
    func initSearchController() {
        searchController.delegate = self
        searchController.placeholder = "Search Drinks.."
        searchCon.searchResultsUpdater = self
//        searchController.loadViewIfNeeded()
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.enablesReturnKeyAutomatically = false
//        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true

//        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    
    

}

extension HomeViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print("text", text)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredList = []
        
        if searchText == "" {
            checkSearchBar = false
            filteredList = drinksList
        } else {
            filteredList = drinksList.map( { (test) -> [Drinks.ResultDrinks] in

                test.filter { (test2) in
                    let nameDrink = test2.strDrink.lowercased().contains(searchText.lowercased())
                    print("Namedrink", nameDrink)
                    checkSearchBar = true
                    return nameDrink
                    
                    
//                    let authorsAndBooks = authors.map { (authorName) -> (String, [Book]) in (authorName, allBooks.filter({ $0.author == authorName })) }
                    
                    
                }
            } )
        
        }

        self.tableViewProducts.reloadData()
        
    }

}

//extension HomeViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//
//        print(text)
//    }
//}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (checkSearchBar == true) {
            return filteredList[section].count
        }
        return drinksList[section].count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (checkSearchBar == true) {
            return filteredList.count
        }
        return drinksList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (checkSearchBar == true) {
            let data = filteredList[indexPath.section]
        }
        
        let data = drinksList[indexPath.section]
        if let prod = data as? [Drinks.ResultDrinks] {
        guard let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell else {
                return UITableViewCell()
            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                cell.SetUpCell(model: prod[indexPath.row])
//            }
            cell.SetUpCell(model: prod[indexPath.row])
        
            print("cell")
            return cell
        }
        return UITableViewCell()
        
        
//        guard let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell else { return UITableViewCell() }
//        cell.SetUpCell(model: drinksList[indexPath.row])
//        return cell
//
        
//
//        let data = drinksList[indexPath.section]
//        let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell
//        cell.SetUpCell(model: data[indexPath.row])
//
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = drinksList[indexPath.section]
        let name: String
        let image: String
        let category: String
        let glass: String
        let alcoholic: String
        let instructions: String
        let instructionsES: String
        
        if let drink = item as? [Drinks.ResultDrinks] {
            
            name = drink[indexPath.row].strDrink
            image = drink[indexPath.row].strDrinkThumb
            category = drink[indexPath.row].strCategory
            glass = drink[indexPath.row].strGlass
            alcoholic = drink[indexPath.row].strAlcoholic
            instructions = drink[indexPath.row].strInstructions
            instructionsES = drink[indexPath.row].strInstructionsES
            
            let vc = DetailProductViewController(name: name, image: image, category: category, glass: glass, alcoholic: alcoholic, instructions: instructions, instructionsES: instructionsES)
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}

extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Drinks.ResultDrinks]]) {
        drinksList = list
        print("List: ", list)
        tableViewProducts.reloadData()
    }
}
