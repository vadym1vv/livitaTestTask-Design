//
//  RouterVM.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation
import SwiftUI

class RouterVM: ObservableObject {
    @Published var screen: ScreenEnum = .tools
    
    func performNavigation(screen: ScreenEnum) {
        withAnimation {
            self.screen = screen
        }
    }
}
