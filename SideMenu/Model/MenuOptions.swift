//
//  MenuOptions.swift
//  SideMenu
//
//  Created by YE002 on 07/07/23.
//

import UIKit

enum MenuOptions: Int, CustomStringConvertible {
    
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
            
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
            
        case .Profile: return UIImage(systemName: "note") ?? UIImage()
        case .Inbox: return UIImage(systemName: "note") ?? UIImage()
        case .Notifications: return UIImage(systemName: "note") ?? UIImage()
        case .Settings: return UIImage(systemName: "note") ?? UIImage()
        }
    }
}
