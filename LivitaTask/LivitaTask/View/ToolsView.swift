//
//  ToolsView.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                ForEach(GlobalConstant.mocData, id: \.self) { designModel in
                    ToolsCardComponent(designModel: designModel)
                        .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ToolsView()
}
