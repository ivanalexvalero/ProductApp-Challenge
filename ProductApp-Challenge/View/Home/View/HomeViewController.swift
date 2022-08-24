//
//  HomeViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)

    @IBOutlet weak var tableViewProducts: UITableView!
    private var drinksList: [Drinks.ResultDrinks] = []
//    var repository = RepositoryApi()
    var serviceTest = ServiceTest()
//    var apiRest = ApiRestService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ProductApp"
        
        ConfigTableView()
//        navigationController?.popToRootViewController(animated: true)
    
        serviceTest.ServiceApiTest()
        Task {
        await presenter.getList()
        }
    }
    

    func ConfigTableView() {
        tableViewProducts.delegate = self
        tableViewProducts.dataSource = self
        tableViewProducts.register(UINib(nibName: ProductViewCell.kId, bundle: nil), forCellReuseIdentifier: ProductViewCell.kId)
        
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinksList.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return drinksList.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let data = drinksList[indexPath.section]
//        if let prod = data as? [Drinks.ResultDrinks] {
//        guard let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell else {
//                return UITableViewCell()
//            }
//        cell.SetUpCell(model: prod[indexPath.row])
//            print("cell")
//            return cell
//        }
//        return UITableViewCell()
        
        
        guard let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell else { return UITableViewCell() }
        cell.SetUpCell(model: drinksList[indexPath.row])
        return cell
        
        
//
//        let data = drinksList[indexPath.section]
//        let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell
//        cell.SetUpCell(model: data[indexPath.row])
//
//        return cell
    }
    
    
}

extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("List: ", list)
    }
}
