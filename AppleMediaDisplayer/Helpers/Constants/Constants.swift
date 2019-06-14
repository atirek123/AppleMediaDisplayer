//
//  Constants.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation


enum CellIdentifiers: String{
    case mediaCell = "MediaTableViewCell"
    case medisSectionCell = "MediaSectionTableViewCell"
    
    var identifier:String{
        return self.rawValue
    }
}
