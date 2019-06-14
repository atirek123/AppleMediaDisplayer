//
//  APConstants.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import ObjectMapper

internal struct APIConstants {
    static let basePath = "https://rss.itunes.apple.com/api/v1/us/"
    
}

//MARK: - Response Type
enum ResponseType : String {
    
    case none
    case success = "200"
    case failure = "400"
    case invalidAccessToken = "401"
    case adminBlocked = "402"
    case fbNotRegistered = "405"
    
    case error = "bad_request"
    
    func map(response message : String?) -> String? {
        return message
    }
}

//MARK: - Result
enum APIResult {
    case success(Any?)
    case failure(String?)
}

//MARK: - Extension Dictionary
extension Dictionary {
    
    //MARK: - Remove Empty Key-Value Pair
    func paramsDictionary() -> Dictionary {
        var dict = self
        
        let keysToRemove = Array(dict.keys).filter { /(dict[$0] as? String) == "" }
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        return dict
    }
}
