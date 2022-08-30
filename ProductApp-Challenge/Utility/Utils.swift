//
//  Utils.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 29/08/2022.
//

import Foundation

class Utils{
    static func parseJson(jsonName : String) -> Drinks?{
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do{
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            do{
                let responseModel = try jsonDecoder.decode(Drinks.self, from: data)
                return responseModel
            }catch{
                print("json mock error: \(error)")
                return nil
            }
        }catch{
            return nil
        }
    }
}
