//
//  MediaTableViewCell.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    //MARK: - Variables
    var mediaImageView = UIImageView()
    var nameLabel = UILabel()
    var mediaTypeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Item
    var item:MediaModel?{
        didSet{
            mediaImageView.setImageFromUrl(url: /item?.artworkUrl100)
            nameLabel.text = /item?.name
           // mediaTypeLabel.text = /item?.artistName
        }
    }
    
    
    //MARK: - Prepare Views
    func prepareViews() {
        selectionStyle = .none
        mediaImageView.layer.cornerRadius = 4
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        mediaImageView.backgroundColor = .darkGray
        mediaImageView.clipsToBounds = true
        addSubview(mediaImageView)
        
        /// adding image view constraint using anchor points
        mediaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0).isActive = true
        mediaImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        mediaImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        mediaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0).isActive = true
        mediaImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0).isActive = true
        
        addNameLabel()
       // addMediaLabel()
    }
    
    //MARK: - Add Name Label
    func addNameLabel() {
        nameLabel.text = ""
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 14.0)
        nameLabel.textColor = UIColor.black.withAlphaComponent(70.0)
        addSubview(nameLabel)
        
        /// adding constraints using Anchor points
        //nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18.0).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 16.0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        
    }
    
    //MARK: - Add Media Type Label
    func addMediaLabel() {
        mediaTypeLabel.text = "Apple Media"
        mediaTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mediaTypeLabel.numberOfLines = 0
        mediaTypeLabel.font = UIFont.systemFont(ofSize: 12)
        mediaTypeLabel.textColor = UIColor.black.withAlphaComponent(70.0)
        addSubview(mediaTypeLabel)
        
        mediaTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4.0).isActive = true
        mediaTypeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0.0).isActive = true
        mediaTypeLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0.0).isActive = true
      
    }
}
