//
//  MediaModel.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import ObjectMapper

class MediaModel:Mappable {
    
    var feed:MediaModel?
    var results:[MediaModel]?
    
    var artistName:String?
    var name:String?
    var artworkUrl100:String?
    
    var mediaType:MediaTypes?
    var isSection:Bool = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        feed <- map["feed"]
        results <- map["results"]
        
        artistName <- map["artistName"]
        name <- map["name"]
        artworkUrl100 <- map["artworkUrl100"]
    }
}
