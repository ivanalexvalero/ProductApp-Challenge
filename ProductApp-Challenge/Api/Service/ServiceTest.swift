//
//  ServiceTest.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import Foundation



//struct ModelProduct: Drinks {
//    var strDrink: String
//
//    enum CondigKeys: String, CodingKey {
//        case strDrink
//    }
//
//    init(json: [String:String?]) {
//        strDrink = json["strDrink"] as? String ?? ""
//    }
//}

class ServiceTest {
    
    var refreshData = { () -> () in}
    
    var drinksList: [Drinks.ResultDrinks] = [] {
        didSet {
            refreshData()
        }
    }
    func ServiceApiTest() {
        
//        guard let path = Bundle.main.path(forResource: "drinks", ofType: "json") else { return }
//
////        let urlString = "www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
//        let url = URL(fileURLWithPath: path)
//
//        var drinks: Drinks?
//
//        do {
//            let jsonData = try Data(contentsOf: url)
//            drinks = try JSONDecoder().decode(Drinks.self, from: jsonData)
////            self.drinksList = drinks
//            if let drinks = drinks {
//                print(drinks)
////                drinksList.first?.strDrink = drinks.drinks as String
//            } else {
//                print("Failed to pase")
//            }
//        } catch  {
//            print("Error: \(error)")
//        }
        
        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//
//            guard let data = data else { return }
//
////            let dataAsString =  String(data: data, encoding: .utf8)
////            print(dataAsString)
////
//            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:String?]] else { return }
//
//
//                let drinkProduct = Drinks(drinks: json)
//                print(drinkProduct.drinks)
//
//
//                print(json)
//            } catch let jsonError {
//                print("Error serialization json: ", jsonError)
//            }
//
//        }.resume()
    }
    
}
