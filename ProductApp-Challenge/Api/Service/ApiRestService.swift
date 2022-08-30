//
//  ApiRestService.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 23/08/2022.
//

import Foundation




class ApiRestService {
    
//    typealias WebServiceResponse = ([[String : String]]?, Error?) -> Void
//    
//    func execute(_ completion: @escaping WebServiceResponse) {
//        let url = "www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
//        
//        AF.request(url).validate().responseJSON { response in
//            
//            if let error = response.error {
//                completion(nil, error)
//            } else if let jsonArray = response.result as? [[String : String]] {
//                completion(jsonArray, nil)
//                print("array")
//            } else if let jsonDict = response.result as? [String : String] {
//                completion([jsonDict], nil)
//                print("dict")
//            }
//        }
//        
//    }
//    
    
    
   
//    private var urlServer: String
//    private var manager: Session
//
//    init(urlServer: String) {
//        self.urlServer = urlServer
//        let configuration: URLSessionConfiguration = {
//            let config = URLSessionConfiguration.default
//
//            return config
//        }()
//        self.manager = Session(configuration: configuration)
//    }
////
////    func listProduct(completionHandler: @escaping(Welcome?) -> Void) {
////        let urlService = "f=a"
////        request(urlService: urlService, completionHandler: completionHandler)
////    }
//
//
//
//    private func request<T:Codable>(urlService: String, completionHandler: @escaping(T?) -> Void) {
//        manager.request("\(self.urlServer)\(urlService)").validate().responseDecodable(of: T.self) { response in
//            guard let data = response.value else {
//                print("Error")
//                return }
//            completionHandler(data)
//            print(data)
//        }
//    }
    
    
}



