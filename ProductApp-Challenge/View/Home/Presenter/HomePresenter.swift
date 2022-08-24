//
//  HomePresenter.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject{
    func getData(list: [[Any]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    private var drinkList: [[Any]] = []
    
    init(delegate: HomeViewProtocol ,provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getList() async {
        drinkList.removeAll()
        
        do {
            let drinks = try await provider.getDrinks().drinks
            
            drinkList.append(drinks)
            
            delegate?.getData(list: drinkList)
            
        } catch {
            print(error)
        }
    }
}
