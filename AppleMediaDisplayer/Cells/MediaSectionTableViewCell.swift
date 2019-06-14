//
//  MediaSectionTableViewCell.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import UIKit

class MediaSectionTableViewCell: UITableViewCell {

    var sectionTitleLabel = UILabel()
    var mediaType:String?{
        didSet{
            sectionTitleLabel.text = /mediaType
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Prepare View
    func prepareViews() {
        sectionTitleLabel.text = "Section Title"
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.numberOfLines = 0
        sectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        sectionTitleLabel.textColor = UIColor.black.withAlphaComponent(70.0)
        addSubview(sectionTitleLabel)
        
        sectionTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0).isActive = true
        sectionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        sectionTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0).isActive = true
        sectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0).isActive = true
        
    }

}
