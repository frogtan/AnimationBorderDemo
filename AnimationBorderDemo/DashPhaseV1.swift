//
//  MarchAnt.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/23.
//

import SwiftUI

struct DashPhaseV1: View {
    private var clockwise = true
    // 通过设置大于0或者小于0的值可以实现逆时针或者顺时针的效果
    @State private var dashPhase: CGFloat = 0
    
    private let dashLength = 20.0
    
    var body: some View {
        Rectangle()
            .strokeBorder(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .round, dash: [dashLength], dashPhase: dashPhase))
            .foregroundStyle(.mint)
            .background(.tertiary)
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: dashPhase)
            .frame(width: 200, height: 200)
        
        Button("Start") {
            dashPhase = clockwise ? -dashLength * 2 : dashLength * 2
        }
        .buttonStyle(.bordered)
        .padding()
    }
}


#Preview {
    DashPhaseV1()
}
