//
//  ModelProduct.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import Foundation

struct Drinks: Codable {
    var drinks: [ResultDrinks]
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
  
        self.drinks = try container.decode([ResultDrinks].self, forKey: .drinks)
    }
    
    
    
    struct ResultDrinks: Codable {
        var strDrink: String
        var strDrinkThumb: String
        var strCategory: String
        var strAlcoholic: String?
        var strGlass: String?
        var strInstructions: String?
        var strInstructionsES:String?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
      
            self.strDrink = try container.decode(String.self, forKey: .strDrink)
            
            self.strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
            
            self.strCategory = try container.decode(String.self, forKey: .strCategory)
            
            
            if let strAlcoholic = try? container.decode(String.self, forKey: .strAlcoholic){
                self.strAlcoholic = strAlcoholic
            }else {
                self.strAlcoholic = nil
            }
            if let strGlass = try? container.decode(String.self, forKey: .strGlass){
                self.strGlass = strGlass
            }else {
                self.strGlass = nil
            }
            if let strInstructions = try? container.decode(String.self, forKey: .strInstructions){
                self.strInstructions = strInstructions
            }else {
                self.strInstructions = nil
            }
            if let strInstructionsES = try? container.decode(String.self, forKey: .strInstructionsES){
                self.strInstructionsES = strInstructionsES
            }else {
                self.strInstructionsES = nil
            
      //            if let id = try? container.decode(Int.self, forKey: .id){
      //                self.id = id
      //            }else {
      //                self.id = nil
                  }
    }
}
}
