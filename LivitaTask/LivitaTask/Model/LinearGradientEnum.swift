//
//  LinearGradientEnum.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation
import SwiftUI

enum LinearGradientEnum {
    case primary, whiteGradient, blackGradient
    
    var linearGradientColors: LinearGradient {
        switch self {
        case .primary:
            return LinearGradient(colors: [ColorEnum.colFE9448.color, ColorEnum.colB57BFF.color, ColorEnum.col6981FF.color], startPoint: .leading, endPoint: .bottom)
        case .whiteGradient:
            return LinearGradient(colors: [Color.clear, ColorEnum.linearGradient80.color], startPoint: .top, endPoint: .bottom)
        case .blackGradient:
            return LinearGradient(colors: [ColorEnum.col0000000.color, ColorEnum.col0000030.color], startPoint: .bottom, endPoint: .top)
        }
    }
}
