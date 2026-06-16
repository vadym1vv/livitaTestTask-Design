//
//  ColorEnum.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation
import SwiftUI

enum ColorEnum: String {
    case customBlack, col6981FF, colB57BFF, colFE9448, grey20, grey30, grey60, customWhite, linearGradient0, linearGradient80, grey50, white90, white80, col0000000, col0000030
    
    var color: Color {
        return Color(self.rawValue)
    }
}
