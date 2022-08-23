//
//  HomeViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class NoHomeViewController: UIViewController {

    @IBOutlet weak var tableViewProducts: UITableView!
    private var products: [String] = ["Product1", "Product2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ProductApp"
        
//        ConfigTableView()
    }
    

//    func ConfigTableView() {
//        tableViewProducts.delegate = self
//        tableViewProducts.dataSource = self
//        tableViewProducts.register(UINib(nibName: ProductViewCell.kId, bundle: nil), forCellReuseIdentifier: ProductViewCell.kId)
//
//    }

}


