//
//  ViewController.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHomeView()
    }
    
    func loadHomeView() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}

