//
//  HomeViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewProducts: UITableView!
    private var products: [ModelProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ProductApp"
        
        ConfigTableView()
        navigationController?.popToRootViewController(animated: true)
       
    }
    

    func ConfigTableView() {
        tableViewProducts.delegate = self
        tableViewProducts.dataSource = self
        tableViewProducts.register(UINib(nibName: ProductViewCell.kId, bundle: nil), forCellReuseIdentifier: ProductViewCell.kId)
        
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return products.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProducts.dequeueReusableCell(withIdentifier: ProductViewCell.kId, for: indexPath) as? ProductViewCell
        cell?.SetUpCell(model: products[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}
