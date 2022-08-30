//
//  HomeProviderMock.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 29/08/2022.
//

import Foundation

class HomeProviderMock: HomeProviderProtocol {
    func getText() async throws -> Drinks {
        guard let model = Utils.parseJson(jsonName: "drinks") else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
}
