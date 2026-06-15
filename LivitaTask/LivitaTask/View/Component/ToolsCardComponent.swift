//
//  ToolsCardComponent.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import SwiftUI

struct ToolsCardComponent: View {
    
    let designModel: DesignModel
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                NavigationLink {
                    SketchToRenderView(designModel: designModel)
                } label: {
                    GeometryReader { geometry in
                        let spacing: CGFloat = 2
                        let halfWidth = (geometry.size.width - spacing) / 2
                        
                        HStack(spacing: spacing) {
                            Image(designModel.imgBefore)
                                .resizable()
                                .scaledToFill()
                                .frame(width: halfWidth, height: geometry.size.height, alignment: .leading)
                                .clipped()
                            
                            Image(designModel.imgAfter)
                                .resizable()
                                .scaledToFill()
                                .frame(width: halfWidth, height: geometry.size.height, alignment: .trailing)
                                .clipped()
                        }
                    }
                    .frame(maxHeight: 129)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding([.top, .horizontal], 12)
                .padding(.bottom, 8)
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(designModel.title)
                            .font(FontEnum.body1semibold.font)
                            .foregroundStyle(ColorEnum.customBlack.color)
                        Text(designModel.description)
                            .font(FontEnum.body2regular.font)
                            .foregroundStyle(ColorEnum.grey60.color)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    NavigationLink {
                        SketchToRenderView(designModel: designModel)
                    } label: {
                        Image(IconEnum.arrowRight.icon)
                            .frame(width: 49, height: 32)
                            .background(ColorEnum.customBlack.color)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                    }
                    
                }
                .padding([.bottom, .horizontal])
                
            }
            .frame(maxWidth: .infinity)
            .background(ColorEnum.customWhite.color)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(ColorEnum.grey20.color)
            }
        }
        .frame(minHeight: 226)
    }
}

#Preview {
        ToolsCardComponent(designModel: GlobalConstant.mocData[1])
            .padding(.horizontal)
}

