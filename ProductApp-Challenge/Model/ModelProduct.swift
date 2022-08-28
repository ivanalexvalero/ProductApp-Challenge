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
        var strAlcoholic: String
        var strGlass: String
        var strInstructions: String
        var strInstructionsES:String
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
      
            self.strDrink = try container.decode(String.self, forKey: .strDrink)
            
            self.strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
            
            self.strCategory = try container.decode(String.self, forKey: .strCategory)
            
            self.strAlcoholic = try container.decode(String.self, forKey: .strAlcoholic)
            
            self.strGlass = try container.decode(String.self, forKey: .strGlass)
            
            self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
            
            self.strInstructionsES = try container.decode(String.self, forKey: .strInstructionsES)
            
            
            
      //            if let id = try? container.decode(Int.self, forKey: .id){
      //                self.id = id
      //            }else {
      //                self.id = nil
                  }
    }
}



//{
//"idDrink": "17835",
//            "strDrink": "Abilene",
//            "strDrinkAlternate": null,
//            "strTags": null,
//            "strVideo": null,
//            "strCategory": "Ordinary Drink",
//            "strIBA": null,
//            "strAlcoholic": "Alcoholic",
//            "strGlass": "Highball glass",
//            "strInstructions": "Pour all of the ingredients into a highball glass almost filled with ice cubes. Stir well.",
//            "strInstructionsES": "Coloque todos los ingredientes en un vaso alto casi lleno de cubitos de hielo. Sacudir bien.",
//            "strInstructionsDE": null,
//            "strInstructionsFR": null,
//            "strInstructionsIT": "Versare tutti gli ingredienti in un bicchiere highball riempito di cubetti di ghiaccio. Mescolare bene.",
//            "strInstructionsZH-HANS": null,
//            "strInstructionsZH-HANT": null,
//            "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/smb2oe1582479072.jpg",
//            "strIngredient1": "Dark rum",
//            "strIngredient2": "Peach nectar",
//            "strIngredient3": "Orange juice",
//            "strIngredient4": null,
//            "strIngredient5": null,
//            "strIngredient6": null,
//            "strIngredient7": null,
//            "strIngredient8": null,
//            "strIngredient9": null,
//            "strIngredient10": null,
//            "strIngredient11": null,
//            "strIngredient12": null,
//            "strIngredient13": null,
//            "strIngredient14": null,
//            "strIngredient15": null,
//            "strMeasure1": "1 1/2 oz ",
//            "strMeasure2": "2 oz ",
//            "strMeasure3": "3 oz ",
//            "strMeasure4": null,
//            "strMeasure5": null,
//            "strMeasure6": null,
//            "strMeasure7": null,
//            "strMeasure8": null,
//            "strMeasure9": null,
//            "strMeasure10": null,
//            "strMeasure11": null,
//            "strMeasure12": null,
//            "strMeasure13": null,
//            "strMeasure14": null,
//            "strMeasure15": null,
//            "strImageSource": null,
//            "strImageAttribution": null,
//            "strCreativeCommonsConfirmed": "Yes",
//            "dateModified": "2016-04-29 09:44:25"
//        },
