//
//  RootRouter.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import SwiftUI

struct RootRouter: View {
    
    @StateObject private var routerVM: RouterVM = RouterVM()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TopBarNavigationComponent(
                    leadingView:
                        Button(action: {
                        }, label: {
                            Text("GET PRO")
                                .frame(width: 94, height: 32)
                                .background(LinearGradientEnum.primary.linearGradientColors)
                                .clipShape(RoundedRectangle(cornerRadius: 96))
                                .font(FontEnum.buttonBold.font)
                                .foregroundStyle(ColorEnum.customWhite.color)
                        }),
                    centerView:
                        EmptyView(),
                    trailingView:
                        Button(action: {
                            
                        }, label: {
                            Image(IconEnum.topBarPerson.icon)
                                .frame(width: 44, height: 44)
                        })
                )
                .padding(.top, getSafeArea().top)
                
                ZStack {
                    routerVM.screen.view
                    VStack {
                        Spacer()
                        ZStack {
                            VStack {
                                NavigationBarComponent()
                                    .environmentObject(routerVM)
                                    
                                Spacer()
                            }
                            .zIndex(1)
                            LinearGradientEnum.whiteGradient.linearGradientColors
                        }
                        .frame(height: 96)
                        .frame(maxWidth: .infinity)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorEnum.grey20.color)
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    RootRouter()
}
