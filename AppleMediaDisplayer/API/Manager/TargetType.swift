//
//  TargetType.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import Alamofire

typealias OptionalDictionary = [String:Any]?

//MARK: - Target Type Protocol
protocol TargetType{
    
    /// for basepath
    var basePath:String { get }
    
    /// for request parameters
    var parameters: OptionalDictionary {get}
    
    /// for routes
    var path: String {get}
    
    /// request method
    var method:Alamofire.HTTPMethod { get }
    
}
