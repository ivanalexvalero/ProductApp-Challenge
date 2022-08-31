//
//  RequestModel.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

struct RequestModel {
//    var routeValue: RouteValue?
    let endpoint: Endpoints
    var queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .drinks

    
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
        case empty = ""
    }
    
    enum URLBase: String {
        case drinks = "https://www.thecocktaildb.com/api/json/v1/1"
    }
    
    
    
    
}
