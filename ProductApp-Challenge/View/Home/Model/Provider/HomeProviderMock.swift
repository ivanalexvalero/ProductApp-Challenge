//
//  HomeProviderMock.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 29/08/2022.
//

import Foundation

class HomeProviderMock: HomeProviderProtocol {
    var throwError: Bool = false
    
    func getDrinks() async throws -> Drinks {
        if throwError {
            throw NetworkError.generic
        }
        
        guard let model = Utils.parseJson(jsonName: "drinks") else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
}
