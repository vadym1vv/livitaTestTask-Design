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
        VStack(spacing: 0) {
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
                                .frame(width: halfWidth, height: 129, alignment: .leading)
                                .clipped()
                            
                            Image(designModel.imgAfter)
                                .resizable()
                                .scaledToFill()
                                .frame(width: halfWidth, height: 129, alignment: .trailing)
                                .clipped()
                        }
                    }
                    .frame(height: 129)
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
                        RoundedRectangle(cornerRadius: 60)
                            .frame(width: 49, height: 32)
                            .foregroundStyle(ColorEnum.customBlack.color)
                            .overlay {
                                Image(systemName:"arrow.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(ColorEnum.customWhite.color)
                            }
                    }
                    .shadow(color: Color.black.opacity(0.04), radius: 16, x: 5, y: 4)
                }
                .padding([.bottom, .horizontal], 12)
                
            }
            .frame(maxWidth: .infinity)
            .background(ColorEnum.customWhite.color)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(ColorEnum.grey20.color)
            }
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 8){
            ForEach(GlobalConstant.mocData, id: \.self) { designModel in
                ToolsCardComponent(designModel: designModel)
                    .padding(.horizontal)
                    .padding(.vertical, 0)
            }
        }
    }
}

