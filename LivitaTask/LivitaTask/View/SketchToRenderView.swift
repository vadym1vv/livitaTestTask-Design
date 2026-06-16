//
//  SketchToRenderView.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import SwiftUI

struct SketchToRenderView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var sliderPercentage: CGFloat = 0.5
    
    let designModel: DesignModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                ImgComparisonComponent()
                Spacer()
                HStack(spacing: 8) {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 6) {
                            Image(IconEnum.save.icon)
                            Text("Resize")
                                .font(FontEnum.body2Medium.font)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(ColorEnum.customWhite.color)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(ColorEnum.grey30.color)
                        }
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 6) {
                            Image(IconEnum.resize.icon)
                            Text("Save")
                                .font(FontEnum.body2Medium.font)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(ColorEnum.customWhite.color)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(ColorEnum.grey30.color)
                        }
                    }
                }
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 8) {
                        Image(IconEnum.iconArrow.icon)
                        Text("Regenerate")
                            .font(FontEnum.body1medium.font)
                            .foregroundStyle(ColorEnum.customWhite.color)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(ColorEnum.customBlack.color)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                }
                .padding(.top, 16)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, getSafeArea().bottom + 16)
            .padding(.top, getSafeArea().top + 48)
            .foregroundStyle(ColorEnum.customBlack.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorEnum.grey20.color)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    fileprivate func ImgComparisonComponent() -> some View {
        VStack {
            GeometryReader { geometry in
                let totalWidth = geometry.size.width
                let totalHeight = geometry.size.height
                let currentDragX = totalWidth * sliderPercentage
                
                ZStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text("Before")
                                .frame(width: 56, height: 26)
                                .background(ColorEnum.white80.color)
                                .font(FontEnum.body2semibold.font)
                                .foregroundStyle(ColorEnum.customBlack.color)
                                .clipShape(RoundedRectangle(cornerRadius: 96))
                                .padding()
                            Spacer()
                            Text("After")
                                .frame(width: 56, height: 26)
                                .background(ColorEnum.white80.color)
                                .font(FontEnum.body2semibold.font)
                                .foregroundStyle(ColorEnum.customBlack.color)
                                .clipShape(RoundedRectangle(cornerRadius: 96))
                                .padding()
                        }
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradientEnum.blackGradient.linearGradientColors)
                        Spacer()
                    }
                    .zIndex(1)
                    Image(designModel.imgAfter)
                        .resizable()
                        .scaledToFill()
                        .frame(width: totalWidth, height: totalHeight)
                        .clipped()
                    
                    Image(designModel.imgBefore)
                        .resizable()
                        .scaledToFill()
                        .frame(width: totalWidth, height: totalHeight)
                        .frame(width: currentDragX, height: totalHeight, alignment: .leading)
                        .clipped()
                    ZStack {
                        Rectangle()
                            .fill(ColorEnum.customWhite.color)
                            .frame(width: 4)
                        Circle()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(ColorEnum.customWhite.color)
                            .overlay {
                                Image(IconEnum.chevronUpChevronDown.icon)
                            }
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                    }
                        .contentShape(Rectangle())
                        .offset(x: currentDragX - 20)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let newX = value.location.x
                                    let boundedX = max(0, min(totalWidth, newX))
                                    withAnimation(.linear(duration: 0)) {
                                        self.sliderPercentage = boundedX / totalWidth
                                    }
                                }
                               
                        )
                }
            }
            .frame(height: 436)
            .cornerRadius(24)
        }
    }
}

#Preview {
    SketchToRenderView(designModel: GlobalConstant.mocData[1])
    
}
