//
//  DashPhaseV2.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/24.
//

import SwiftUI

struct DashPhaseV2: View {
    private var clockwise = true
    // 通过设置大于0或者小于0的值可以实现逆时针或者顺时针的效果
    @State private var dashPhase: CGFloat = 0
    private var dash: [CGFloat] = [100, 635]
    private var cornerRadius:CGFloat = 20 //周长是765.66
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .miter, dash: dash, dashPhase: dashPhase))
            .foregroundStyle(.mint)
            .background(.tertiary)
            .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: dashPhase)
            .frame(width: 200, height: 200)
        
        Button("Start") {
            let length = dash.reduce(0, +)
            dashPhase = clockwise ? -length : length
        }
        .buttonStyle(.bordered)
        .padding()
    }
}

#Preview {
    DashPhaseV2()
}
