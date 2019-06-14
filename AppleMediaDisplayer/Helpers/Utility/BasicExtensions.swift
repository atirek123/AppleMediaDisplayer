//
//  BasicExtensions.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension Int{
    
    //MARK: - To String
    var toString:String?{
        return String(self)
    }
    
}


//MARK: - UIImageView Extensions
extension UIImageView {
    
    //MARK: - Set Image from URL
    func setImageFromUrl(url :String? , placeHolder: UIImage? = nil){
        var myKf = self.kf
        myKf.indicatorType = .activity
        
        if /url?.isEmpty {
            self.image = placeHolder
        }else{
            if let urlTemp = URL(string: /url?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)) {
                self.kf.setImage(with: urlTemp)
            }
        }
    }
}
