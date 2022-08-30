//
//  RequestModel.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

struct RequestModel {
    var routeValue: RouteValue?
    let endpoint: Endpoints
    var queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .drinks
  
//
//        var description: String {
//            getLetter()
//        }
//        func getLetter() -> String {
//            let xs = (0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0) ?? "a")})
//            let fr = "\(xs)"
//            return fr
//        }
//
////
//
//        var description: String {
//            switch self {
//            case .details:
//                let xs = (0..<26).map({Character(UnicodeScalar("a".unicodeScalars.first!.value + $0) ?? "a")})
//                return "\(xs)"
//            case .noneId:
//                return ""
//            }
//        }
//    }
//
    

    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String   {
//        /random.php
//        /search.php?f=a
        case drinks = "/search.php?f=a"
        case text = "/posts"
        case empty = ""
    }
    
    enum URLBase: String {
        case drinks = "https://www.thecocktaildb.com/api/json/v1/1"
//        case text = "https://jsonplaceholder.typicode.com"
    }
    
    
    
    
}
