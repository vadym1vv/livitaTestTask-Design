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
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(GlobalConstant.mocData, id: \.self) { designModel in
                        ToolsCardComponent(designModel: designModel)
                            .padding(.horizontal)
                            .padding(.vertical, 0)
                    }
                }
                .padding(.top, 12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ToolsView()
}
