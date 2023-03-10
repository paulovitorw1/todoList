//
//  DSColors.swift
//  todoList
//
//  Created by Paulo Vitor on 08/03/23.
//

import Foundation
import UIKit

enum DSColors {
    case primary
    case secondary
    case secondaryShades
    case secondaryLight
    case secondaryTextLight
    
    var uiColors: UIColor {
        switch self {
        case .primary:
            return UIColor(red: 0.141, green: 0.184, blue: 0.608, alpha: 1)
        case .secondary:
            return UIColor(red: 0.392, green: 0.435, blue: 0.831, alpha: 1)
        case .secondaryShades:
            return UIColor(red: 0.608, green: 0.639, blue: 0.922, alpha: 1)
        case .secondaryLight:
            return UIColor(red: 0.859, green: 0.875, blue: 0.992, alpha: 1)
        case .secondaryTextLight:
            return UIColor(red: 0.553, green: 0.576, blue: 0.671, alpha: 1)
        }
    }
}
