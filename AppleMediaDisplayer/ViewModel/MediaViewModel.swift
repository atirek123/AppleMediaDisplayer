//
//  MediaViewModel.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper

enum MediaTypes:String{
    case AppleMusic = "apple-music"
    case iTunesMusic = "itunes-music"
    case iOSApps = "ios-apps"
    case AudioBooks = "audiobooks"
    
    enum FeedType:String{
        case hotTracks = "hot-tracks"
        case topFree = "top-free"
        case topAudioBooks = "top-audiobooks"
    }
    
    var feed:String{
        switch self{
        case .AppleMusic,.iTunesMusic:
            return FeedType.hotTracks.rawValue
        case .iOSApps:
            return FeedType.topFree.rawValue
        case .AudioBooks:
            return FeedType.topAudioBooks.rawValue
        }
    }
    
    var type:String{
        switch self {
        case .AppleMusic:
            return "Apple Music"
        case .iTunesMusic:
            return "iTunes Music"
        case .iOSApps:
            return "iOS Apps"
        case .AudioBooks:
            return "Audiobooks"
        
        }
    }
}


class MediaViewModel{
    
    var disposeBag = DisposeBag()
    
    var items = BehaviorRelay<[MediaModel]>(value:[])
    
    var apiCompleted:((Bool) -> Void)?
    
    //MARK: - Get Media
    func getAppleMedia() {
        
        ///apple music type
        HomeEndPoint.mediaTypes(mediaType: MediaTypes.AppleMusic.rawValue, feedtype: MediaTypes.AppleMusic.feed, genre: "all", limit: "5")
        .request()
        .asObservable()
            .subscribe(onNext: { (value) in
                guard let object = value as? MediaModel else{
                    return
                }
               self.addModels(mediaType: .AppleMusic, object: object)
            })<disposeBag
        
        ///iTunes music type
        HomeEndPoint.mediaTypes(mediaType: MediaTypes.iTunesMusic.rawValue, feedtype: MediaTypes.iTunesMusic.feed, genre: "all", limit: "5")
            .request()
            .asObservable()
            .subscribe(onNext: { (value) in
                guard let object = value as? MediaModel else{
                    return
                }
               self.addModels(mediaType: .iTunesMusic, object: object)
            })<disposeBag
        
        ///iOS Apps type
        HomeEndPoint.mediaTypes(mediaType: MediaTypes.iOSApps.rawValue, feedtype: MediaTypes.iOSApps.feed, genre: "all", limit: "5")
            .request()
            .asObservable()
            .subscribe(onNext: { (value) in
                guard let object = value as? MediaModel else{
                    return
                }
               self.addModels(mediaType: .iOSApps, object: object)
            })<disposeBag
        
        ///Audio Books music type
        HomeEndPoint.mediaTypes(mediaType: MediaTypes.AudioBooks.rawValue, feedtype: MediaTypes.AudioBooks.feed, genre: "all", limit: "5")
            .request()
            .asObservable()
            .subscribe(onNext: { (value) in
                guard let object = value as? MediaModel else{
                    return
                }
                self.addModels(mediaType: .AudioBooks, object: object)
            })<disposeBag
    }
    
    //MARK: - Add Models
    func addModels(mediaType: MediaTypes,
                   object:MediaModel) {
        guard let mediaModel = MediaModel(map: Map(mappingType: .toJSON, JSON: [:])) else{
            return
        }
        mediaModel.isSection = true
        mediaModel.mediaType = mediaType
        
        /// adding extra to differentiate with section
        var array = self.items.value
        array.append(mediaModel)
        array.append(contentsOf: /object.feed?.results)
        self.items.accept(array)
        
        self.apiCompleted?(true)
    }
    
}
