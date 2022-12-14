//
//  HomeProvider.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

protocol HomeProviderProtocol {
    func getDrinks() async throws -> Drinks
}

class HomeProvider: HomeProviderProtocol {
    
    func getDrinks() async throws -> Drinks {
        
        let requestModel = RequestModel(endpoint: .drinks)
        
        do {
            let model = try await ServiceLayer.callService(requestModel)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
}
