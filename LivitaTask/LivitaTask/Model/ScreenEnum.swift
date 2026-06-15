//
//  ScreenEnum.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation
import SwiftUI

enum ScreenEnum: String, CaseIterable, Identifiable {
    
    var id: Self {self}
    
    case tools, gallery, discover
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .tools:
            ToolsView()
        case .gallery:
            GalleryView()
        case .discover:
            DiscoverView()
        }
    }
}
