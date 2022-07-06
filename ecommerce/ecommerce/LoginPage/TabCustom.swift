//
//  TabCustom.swift
//  
//
//  Created by xcode on 7/6/22.

import UIKit
enum TabItem: String, CaseIterable {
    case settings = "phoneSettings"
    case siteMap = "SiteMap"
    case language = "language"
    
var viewController: UIViewController {
        switch self {
        case .settings:
            return SettingsViewController()
    
        case .siteMap:
            return SiteMapViewController()
        case .language:
            return SiteMapViewController()

        }
    }
    // these can be your icons
    
        
    }
var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }

