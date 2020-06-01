//
//  HearthstoneRepository.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 01/06/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation
import UIKit

class HearthstoneRepository {
    
    var session = URLSession.shared
    
    let parseError = NSError(domain: "convertData", code: 1, userInfo: [NSLocalizedDescriptionKey: [NSLocalizedDescriptionKey : "Couldn't parsed the json results key."]])
    
    
    func getCategories(_ completionHandler: @escaping (_ response: GameInfo?, _ error: NSError?) -> Void) {
        let request = InfoRequest()
        BaseRequester().taskForGETMethod(request: request, responseType: InfoResponse.self) { (response, error) in
            if let response = response {
                let gameInfo = GameInfo(response: response)
                completionHandler(gameInfo, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    func getCardsByFilter(filter: CardsFilter, option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
        
        var request: HearthstoneRequest
        switch filter {
        case .bySet:
            request = CardsBySetRequest(with: option)
        case .byClass:
            request = CardsByClassRequest(with: option)
        case .byType:
            request = CardsByTypeRequest(with: option)
        case .faction:
            request = CardsByFactionRequest(with: option)
        case .quality:
            request = CardsByQualityRequest(with: option)
        case .race:
            request = CardsByRaceRequest(with: option)
        }
        
        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
            if let response = response {
                let cards = response.map { (cardResponse) -> Card in
                    return Card(with: cardResponse)
                }
                completionHandler(cards, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    
//    func getCardsBySet(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsBySetRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
//    func getCardsByClass(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsByClassRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
//    func getCardsByRace(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsByRaceRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
//    func getCardsByQuality(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsByQualityRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
//    func getCardsByType(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsByTypeRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
//    func getCardsByFaction(option: String,_ completionHandler: @escaping (_ response: [Card]?, _ error: NSError?) -> Void) {
//        let request = CardsByFactionRequest(with: option)
//        BaseRequester().taskForGETMethod(request: request, responseType: [CardsResponse].self) { (response, error) in
//            if let response = response {
//                let cards = response.map { (cardResponse) -> Card in
//                    return Card(with: cardResponse)
//                }
//                completionHandler(cards, nil)
//            } else {
//                completionHandler(nil, error)
//            }
//        }
//    }
    
    func getImage(withURL url:URL, completion: @escaping (_ image:UIImage?)->()) {
        BaseRequester.getImage(withURL: url, completion: completion)
    }
    
    // MARK: Shared
    class func sharedInstance() -> HearthstoneRepository {
        struct Singleton {
            static var sharedInstance = HearthstoneRepository()
        }
        return Singleton.sharedInstance
    }
}
