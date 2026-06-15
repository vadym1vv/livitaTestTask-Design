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
        ZStack {
            LinearGradientEnum.whiteGradient.linearGradientColors
            HStack {
                ForEach(ScreenEnum.allCases) { screen in
                    Spacer()
                    Button {
                        routerVM.performNavigation(screen: screen)
                    } label: {
                        VStack(spacing: 3) {
                            Image(screen.rawValue)
                                .renderingMode(.template)
                            Text(screen.rawValue.capitalized)
                                .font(FontEnum.barFont.font)
                        }
                        .foregroundStyle(screen == routerVM.screen ? ColorEnum.black.color : ColorEnum.grey50.color)
                    }
                    .padding(.vertical)
                    Spacer()
                }
            }
            .background(ColorEnum.white.color)
            .overlay {
                RoundedRectangle(cornerRadius: 96)
                    .stroke(ColorEnum.white.color)
            }
            .shadow(
                color: .black.opacity(0.04),
                radius: 4,
                x: 2,
                y: 2
            )
            .clipShape(RoundedRectangle(cornerRadius: 96))
            .padding(.horizontal)
            .padding(.bottom, 20)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height / 10)
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
