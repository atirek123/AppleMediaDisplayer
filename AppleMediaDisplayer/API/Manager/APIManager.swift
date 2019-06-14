//
//  APIManager.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class APIManager {
    
    /// shared variables
    static var shared = APIManager()
    
    
    //MARK: - Request API
    func request(api:TargetType,
                 isLoaderNeeded:Bool = true,
                 completion:@escaping (APIResult) -> Void) {
        
        let url = api.basePath + api.path
        debugPrint(url)
       
        debugPrint(api.parameters ?? [:])
        
        
        if isLoaderNeeded{
           // Loader.shared.startLoader()
        }
        
        Alamofire.request(url, method: api.method, parameters: api.parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            
            switch dataResponse.result {
            case .success(let data):
                self.successMethod(response: data,completion: completion)
            case .failure(let error):
                completion(APIResult.failure(/error.localizedDescription))
            }
        }
        
    }
    
    //MARK: - Request With Images
    func requestWithImage(api:TargetType,
                          isLoaderNeeded:Bool = true,
                          completion:@escaping (APIResult) -> Void) {
        
    }
    
    //MARK: - Success method
    func successMethod(response: Any,
                       completion:@escaping (APIResult) -> Void) {
        
        let json = JSON(response)
        debugPrint(json)
        let responseType = ResponseType(rawValue: /json["statusCode"].intValue.toString) ?? .failure
        switch responseType {
        case .success:
            completion(APIResult.success(json))
        case .invalidAccessToken:
           break
        default:
           completion(APIResult.success(json))
        }
        
    }
}
