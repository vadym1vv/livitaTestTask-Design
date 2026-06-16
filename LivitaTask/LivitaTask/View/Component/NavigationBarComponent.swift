//
//  NavigationBarComponent.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import SwiftUI

struct NavigationBarComponent: View {
    
    @EnvironmentObject private var routerVM: RouterVM
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(ScreenEnum.allCases) { screen in
                    Button {
                        routerVM.performNavigation(screen: screen)
                    } label: {
                        VStack(spacing: 3) {
                            Image(screen.rawValue)
                                .renderingMode(.template)
                            Text(screen.rawValue.capitalized)
                                .font(FontEnum.barFont.font)
                        }
                        .foregroundStyle(screen == routerVM.screen ? ColorEnum.customBlack.color : ColorEnum.grey50.color)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 24)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 96)
                .stroke(ColorEnum.customWhite.color)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 62)
        .background(ColorEnum.customWhite.color)
        .clipShape(RoundedRectangle(cornerRadius: 96))
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 2, y: 2)
        .padding(.horizontal, 16)
    }
}

#Preview {
    VStack {
        Spacer()
        NavigationBarComponent()
            .environmentObject(RouterVM())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black)
}
