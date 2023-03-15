//
//  DeepLinkNavigator.swift
//  DeepLinkTest
//
//  Created by Nguyen, Michael on 3/13/23.
//

import UIKit
import Foundation

struct DeepLink {
    enum Command: String {
        case view = "view"
        case create = "create"
        case unknown = ""
    }

    enum EventType: String {
        case appointment = "appointment"
        case messages = "messages"
        case insurance = "labtest"
        case medicines = "medicines"
        case immunizations = "immunizations"

        case unknown = ""
    }

    var command: Command
    var eventType: EventType
    var messageId: String
    var params: [String: Any]?

    init(command: Command, eventType: EventType, messageId: String, params: [URLQueryItem]? = nil) {
        self.command = command
        self.eventType = eventType
        self.messageId = messageId
        self.params = [String: Any]()
        params?.forEach( { self.params![$0.name] = $0.value})

    }

    init(url: URL) {
        let urlComponents = URLComponents(string: url.absoluteURL.absoluteString)
        let queryItems = urlComponents?.queryItems
        let components = url.pathComponents
        self.command = Command(rawValue: components.first ?? "") ?? .unknown
        self.eventType = EventType(rawValue: components.count > 1 ? components[1] : "") ?? .unknown
        self.messageId = components.count > 2 ? components[2] : ""
        queryItems?.forEach( { self.params![$0.name] = $0.value})
    }

}

class DeepLinkNavigator {
    static let instance = DeepLinkNavigator()

    private init() {

    }

    // define structure of URL
    // scheme://hostname/<command>/<event type>/<id>
    fileprivate func parseLink(_ url: URL) -> DeepLink? {
        var deepLink = DeepLink(url: url)

        return deepLink

    }

    func handleNavigationUserActivty(_ userActivity: NSUserActivity, navigationController: UINavigationController) {
        if userActivity.activityType != NSUserActivityTypeBrowsingWeb {
            return
        }
        guard let url = userActivity.webpageURL else { return }
        let deepLink = parseLink(url)
        
        switch (deepLink?.command) {
        case .view:
            // bring up a view to the appropriate type
            switch (deepLink?.eventType) {
            case .appointment:
                
                break
            case .messages:
                
                break
            default:
                
                break
            }
            
            break
        case .create:
            
            break
        default:
            // do nothing
            print("default case: ", deepLink?.command as Any)
        }
        
    }
}
