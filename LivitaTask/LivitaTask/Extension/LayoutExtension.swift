//
//  LayoutExtension.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 16.06.2026.
//

import SwiftUI

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
