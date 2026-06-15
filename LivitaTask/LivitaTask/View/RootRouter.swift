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
                        })
                )
                ZStack {
                    routerVM.screen.view
                    VStack {
                        Spacer()
                        NavigationBarComponent()
                            .environmentObject(routerVM)
                            
                    }
                }
                .ignoresSafeArea()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorEnum.grey20.color)
            
        }
    }
}

#Preview {
    RootRouter()
}
