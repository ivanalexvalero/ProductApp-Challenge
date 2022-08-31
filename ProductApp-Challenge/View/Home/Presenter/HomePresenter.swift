//
//  HomePresenter.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject, HomeProtocol{
    func getData(list: [[Drinks.ResultDrinks]])
}

@MainActor class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    var drinkList: [[Drinks.ResultDrinks]] = []
    
    init(delegate: HomeViewProtocol ,provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
        #if DEBUG
        if MockManager.shared.runAppWithMock {
            self.provider = HomeProviderMock()
        }
        #endif
    }
    
    
    func getDrinkList() async {
        drinkList.removeAll()
        
        do {
            let listText = try await provider.getDrinks()
            
            drinkList.append(listText.drinks)
            
            delegate?.getData(list: drinkList)
            
        } catch {
            delegate?.showError(error.localizedDescription, callback: {
                Task { [weak self] in
                    await self?.getDrinkList()
                }
            })
            
        }
    }
}
