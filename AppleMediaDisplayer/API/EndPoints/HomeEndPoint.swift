//
//  HomeEndPoint.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import ObjectMapper

enum HomeEndPoint{
    case mediaTypes(mediaType:String?,feedtype:String?,genre:String?,limit:String?)
}

extension HomeEndPoint: TargetType{
    var basePath: String {
       return APIConstants.basePath
    }
    
    var parameters: OptionalDictionary {
        return nil
    }
    
    var path: String {
        switch self {
        case .mediaTypes(let mediaType,let feedtype,let genre,let limit):
            return "\(/mediaType)" + "/\(/feedtype)" + "/\(/genre)" + "/\(/limit)" + "/explicit.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    //MARK: - Request
    public func request(loader:Bool = true) -> Observable<Any?> {
        
        return Observable<Any?>.create({ (observer) -> Disposable in
            
            let disposables = Disposables.create {}
            APIManager.shared.request(api: self,isLoaderNeeded: loader, completion: { (result) in
                switch result{
                case .success(let data):
                    let json = JSON(data ?? "")
                    observer.onNext(self.parseJSON(json: json))
                case .failure(_):
                    break
                }
            })
            return disposables
        })
        
    }
    
    //MARK: - Parse JSON
    func parseJSON(json:JSON?) -> Mappable? {
        guard let safeResponse = json else{
            return nil
        }
        switch self{
        case .mediaTypes(_): return Mapper<MediaModel>().map(JSONObject: safeResponse.dictionaryObject)
        }
    }
}
