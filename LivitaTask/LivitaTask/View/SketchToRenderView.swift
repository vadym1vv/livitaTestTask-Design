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
    @State private var isDragging = false
    
    let designModel: DesignModel
    
    var body: some View {
        VStack {
            VStack {
                ImgComparisonComponent()
                    .padding(.top)
                Spacer()
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(IconEnum.save.icon)
                            Text("Resize")
                                .font(FontEnum.body2Medium.font)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(ColorEnum.white.color)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(ColorEnum.grey30.color)
                        }
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(IconEnum.resize.icon)
                            Text("Save")
                                .font(FontEnum.body2Medium.font)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(ColorEnum.white.color)
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
                    HStack {
                        Image(IconEnum.iconArrow.icon)
                        Text("Regenerate")
                            .font(FontEnum.body1medium.font)
                            .foregroundStyle(ColorEnum.white.color)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(ColorEnum.black.color)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                }
                .padding([.bottom, .top])
                
            }
            .padding(.horizontal)
            .foregroundStyle(ColorEnum.black.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorEnum.grey20.color)
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
                    Image(designModel.imgAfter)
                        .resizable()
                        .scaledToFill()
                        .frame(width: totalWidth, height: totalHeight)
                        .overlay(alignment: .topTrailing) {
                            Text("Before")
                                .frame(width: 56, height: 26)
                                .background(ColorEnum.white80.color)
                                .foregroundStyle(ColorEnum.black.color)
                                .clipShape(RoundedRectangle(cornerRadius: 96))
                                .opacity(isDragging ? 0 : 1)
                                .animation(.easeInOut(duration: 0.2), value: isDragging)
                                .padding()
                        }
                        .clipped()
                    
                    Image(designModel.imgBefore)
                        .resizable()
                        .scaledToFill()
                        .frame(width: totalWidth, height: totalHeight)
                        .frame(width: currentDragX, height: totalHeight, alignment: .leading)
                        .overlay(alignment: .topLeading) {
                            Text("After")
                                .frame(width: 56, height: 26)
                                .background(ColorEnum.white80.color)
                                .foregroundStyle(ColorEnum.black.color)
                                .clipShape(RoundedRectangle(cornerRadius: 96))
                                .opacity(isDragging ? 0 : 1)
                                .animation(.easeInOut(duration: 0.2), value: isDragging)
                                .padding()
                        }
                        .clipped()
                    
                    ZStack {
                        Rectangle()
                            .fill(ColorEnum.white.color)
                            .frame(width: 4)
                        Image(IconEnum.chevronUpChevronDown.icon)
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .frame(width: 44, height: 44)
                            .background(ColorEnum.white.color)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                    }
                    .frame(width: 40, height: totalHeight)
                    .contentShape(Rectangle())
                    .offset(x: currentDragX - 20)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                isDragging = true
                                let newX = value.location.x
                                let boundedX = max(0, min(totalWidth, newX))
                                withAnimation(.linear(duration: 0)) {
                                    self.sliderPercentage = boundedX / totalWidth
                                }
                            }
                            .onEnded { _ in
                                isDragging = false
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
