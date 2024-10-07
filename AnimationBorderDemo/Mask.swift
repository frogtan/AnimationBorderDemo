//
//  Mask.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/26.
//

import SwiftUI

struct Mask: View {
    @State private var isExpanded = false
    @State private var animationOffset: CGFloat = 0
    @State private var fillPercentage: CGFloat = 0.0
    
    @State private var position: CGFloat = 0

    var body: some View {
        List {
            Section("Shape") {
                Rectangle()
                    .fill(.cyan)
                    .frame(width: 200, height: 200)
                    .mask {
                        Circle()
                    }
                
                Image("bg")
                    .scaledToFill()
                    .frame(width: 400, height: 400)
                    .mask {
                        Circle()
                            .frame(width: isExpanded ? 600 : 100, height: isExpanded ? 600 : 100)
                    }
                
                Button(isExpanded ? "Collapse" : "Expand") {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            }
            
            Section("Text") {
                VStack {
                    Text("SwiftUI")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.yellow, .white, .yellow]),
                                           startPoint: .leading, endPoint: .trailing)
                            .frame(width: 300, height: 100)
                            .offset(x: animationOffset)
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: animationOffset)
                            .mask(
                                Text("SwiftUI")
                                    .font(.system(size: 60, weight: .bold))
                            )
                        )
                        .onAppear {
                            DispatchQueue.main.async {
                                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                                    animationOffset = 300
                                }
                            }
                        }
                }
            }
            
            Section("渐变") {
                Text("SwiftUI")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundStyle(.indigo)
                    .mask {
                        LinearGradient(colors: [.blue, .clear], startPoint: .leading, endPoint: .trailing)
                    }
                
                Text("SwiftUI")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundStyle(.indigo)
                    .mask(AngularGradient(stops: [.init(color: .blue, location: 0),
                                                  .init(color: .blue, location: position),
                                                  .init(color: .clear, location: position),
                                                  .init(color: .clear, location: 1)], center: .center, startAngle: .zero, endAngle: .degrees(360)))
                
                Slider(value: $position, in: 0 ... 1) {}
                
                ZStack {
                    Text("SwiftUI")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(.red)
                        
                    Image("bg")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .mask {
                            LinearGradient(colors: [.red, .clear], startPoint: .leading, endPoint: .trailing)
                        }
                }
            }
        }
    }
}

#Preview {
    Mask()
}
