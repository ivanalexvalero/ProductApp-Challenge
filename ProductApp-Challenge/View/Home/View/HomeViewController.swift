//
//  HomeViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit
import FirebaseAuth

protocol HomeProtocol {
    func showError(_ error: String, callback: (() -> Void)?)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var tableViewProducts: UITableView!
    
    lazy var presenter = HomePresenter(delegate: self)
    let searchController = UISearchController(searchResultsController: nil)
    
    var drinksList: [[Drinks.ResultDrinks]] = []
    var filteredList: [[Drinks.ResultDrinks]] = []
    var serviceTest = ServiceTest()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Drinks"
        
        ConfigTableView()
        
        filteredList = drinksList

        initSearchController()
        
        serviceTest.ServiceApiTest()
        Task {
            await presenter.getTextList()
        }
        
        
    }
    
    

    private func ConfigTableView() {
        tableViewProducts.delegate = self
        tableViewProducts.dataSource = self
        tableViewProducts.register(UINib(nibName: ProductViewCell.kId, bundle: nil), forCellReuseIdentifier: ProductViewCell.kId)
        tableViewProducts.reloadData()
        tableViewProducts.separatorColor = .clear
        
    }
    
    private func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Drinks"
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        
        LogOurApp.logOutButton(viewController: self)
    }
    
}

//extension HomeViewController: UISearchBarDelegate {
////    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//////        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
////    }
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////
////        filteredList = []
////
////        if  searchText == "" {
////
////            filteredList = drinksList
////        }
////        for word in drinksList {
////            if ((word.first?.strDrink.uppercased().contains(searchText.uppercased())) != nil) {
////                filteredList.append(word)
////            }
////        }
////
////
////
////    }
//}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            
            searching = true
            filteredList.removeAll()
            filteredList = drinksList.map( { (test) -> [Drinks.ResultDrinks] in
            
                            test.filter { (test2) in
                                let nameDrink = test2.strDrink.lowercased().contains(searchText.lowercased())
                                print("Namedrink", nameDrink)
                                
                                return nameDrink

                            }
                        } )
        } else {
            searching = false
            filteredList.removeAll()
            filteredList = drinksList
    }
    
        self.tableViewProducts.reloadData()
}
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        filteredList.removeAll()
        tableViewProducts.reloadData()
    }
}
//extension HomeViewController: UISearchBarDelegate, UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//
//        print("text", text)
//
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        filteredList = []
//
//        if searchText == "" {
//            checkSearchBar = false
//            filteredList = drinksList
//        } else {
//            filteredList = drinksList.map( { (test) -> [Drinks.ResultDrinks] in
//
//                test.filter { (test2) in
//                    let nameDrink = test2.strDrink.lowercased().contains(searchText.lowercased())
//                    print("Namedrink", nameDrink)
//                    checkSearchBar = true
//                    return nameDrink
//
//
////                    let authorsAndBooks = authors.map { (authorName) -> (String, [Book]) in (authorName, allBooks.filter({ $0.author == authorName })) }
//
//
//                }
//            } )
//
//        }
//
//        self.tableViewProducts.reloadData()
//
//    }
//
//}

//extension HomeViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//
//        print(text)
//    }
//}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (checkSearchBar == true) {
//            return filteredList[section].count
//        }
        if searching {
            
            return filteredList[section].count
            
        } else {
            return drinksList[section].count
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        if (checkSearchBar == true) {
//            return filteredList.count
//        }
        if searching {
            
            return filteredList.count
            
        } else {
            return drinksList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if (checkSearchBar == true) {
//            let data = filteredList[indexPath.section]
//        }
        
//        if isFiltering() {
//            let data = filteredList[indexPath.section]
//
//        }
        
        let currentDrink: [Drinks.ResultDrinks]
        
        if searching {
            currentDrink = filteredList[indexPath.section]
        } else {
            currentDrink = drinksList[indexPath.section]
        }
//
        let data = currentDrink
        if let prod = data as? [Drinks.ResultDrinks] {
        guard let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell else {
                return UITableViewCell()
            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                cell.SetUpCell(model: prod[indexPath.row])
//            }
            
        
            
            
            cell.SetUpCell(model: prod[indexPath.row])
            cell.productNameLabel.text = prod[indexPath.row].strDrink
            print(currentDrink.first?.strDrink)
             
        
//            print("cell")
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
            glass = drink[indexPath.row].strGlass ?? ""
            alcoholic = drink[indexPath.row].strAlcoholic ?? ""
            instructions = drink[indexPath.row].strInstructions ?? ""
            instructionsES = drink[indexPath.row].strInstructionsES ?? ""
            
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
//        print("List: ", list)
        tableViewProducts.reloadData()
    }
}



class LogOurApp {
    
    static func logOutButton(viewController: UIViewController) {
        let buttonAlert = UIAlertController(title: "Logout", message: "Do you want to log out?", preferredStyle: UIAlertController.Style.alert)
        buttonAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction) in
            
            do{
                try Auth.auth().signOut()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "login")
                vc.modalPresentationStyle = .fullScreen
                viewController.present(vc, animated: true)
                
                
            }catch{
                // error
                print(error)
            }
            
        }))
        
        buttonAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) in
            print("logout to app")
        }))
        
        viewController.present(buttonAlert, animated: true, completion: nil)
    }
}


extension HomeViewController {
    func showError(_ error: String, callback: (() -> Void)?) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
            if action.style == .default {
                if let callback = callback {
                    callback()
                }
                print("retry button pressed")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            if action.style == .cancel {
                print("ok button pressed")
            }
        }))
        
        present(alert, animated: true)
        
    }
}
