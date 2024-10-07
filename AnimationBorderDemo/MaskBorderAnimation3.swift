//
//  MaskBorderAnimation3.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/28.
//

import SwiftUI

struct MaskBorderAnimation3: View {
    @State private var angle: CGFloat = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mint)
                .frame(width: 200, height: 200)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.linearGradient(colors: [.cyan, .indigo, .orange, .brown, .red, .blue], startPoint: .top, endPoint: .bottom))
                .frame(width: 170, height: 300)
                .rotationEffect(.degrees(angle))
                .mask {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.red, lineWidth: 5)
                        .frame(width: 200, height: 200)
                        
                }
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: angle)
               
            
        }
        .onAppear {
            angle = 360
        }
    }
}

#Preview {
    MaskBorderAnimation3()
}
