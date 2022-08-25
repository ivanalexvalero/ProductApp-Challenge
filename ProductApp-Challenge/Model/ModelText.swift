//
//  ModelText.swift
//  ProductApp-Challenge
//
//  Created by Ivan Valero on 24/08/2022.
//

import Foundation

struct TextModel: Codable {
    var textList : [TextInternalModel]
    
    enum CodingKeys: String, CodingKey {
        case textList
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.textList = try container.decode([TextInternalModel].self, forKey: .textList)
//        if let textList = try? container.decode([TextInternalModel].self, forKey: .textList){
//            self.textList = textList
//        }else {
//            self.textList = nil
//        }
    }
    
    struct TextInternalModel: Codable {
        let id: Int
        let title: String
        let body: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case body
        }
        
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
//            if let id = try? container.decode(Int.self, forKey: .id){
//                self.id = id
//            }else {
//                self.id = nil
//            }
//
//            if let title = try? container.decode(String.self, forKey: .title){
//                self.title = title
//            }else {
//                self.title = nil
//            }
//
//            if let body = try? container.decode(String.self, forKey: .body){
//                self.body = body
//            }else {
//                self.body = nil
//            }
//
//        }
    }
    
}

typealias TextModelElements = [TextModel]
