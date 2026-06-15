//
//  FontEnum.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation
import SwiftUI


enum FontEnum: CaseIterable {
    case buttonBold, body1semibold, body1medium, body2regular, body2semibold, barFont, body2Medium
    
    var font: Font {
        switch self {
        case .buttonBold:
            return .system(size: 14, weight: .bold)
        case .body1semibold:
            return .system(size: 16, weight: .semibold)
        case .body2regular:
            return .system(size: 14, weight: .regular)
        case .barFont:
            return .system(size: 10, weight: .medium)
        case .body2semibold:
            return .system(size: 14, weight: .semibold)
        case .body2Medium:
            return .system(size: 14, weight: .medium)
        case .body1medium:
            return .system(size: 16, weight: .medium)
        }
    }
}

struct FontEnum_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScrollView {
                ForEach(FontEnum.allCases, id: \.self) { font in
                    Text("Hello world")
                        .font(font.font)
                }
            }
        }
    }
}
