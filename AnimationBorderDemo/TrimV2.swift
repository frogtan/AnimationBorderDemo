//
//  Trim.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/28.
//

import SwiftUI

struct TrimV2: View {
    @StateObject var context = TrimDataContext()
        
    @Binding var isAnimating: Bool
    @State var progress: CGFloat = 0.0
        
    @State private var lastTimeInterval: TimeInterval?

    var body: some View {
        TimelineView(.animation(paused: !isAnimating)) { ctx in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.cyan)
                    .frame(width: 200, height: 200)

                RoundedRectangle(cornerRadius: 20)
                    .trim(from: context.start1, to: context.end1)
                    .stroke(style: .init(lineWidth: 6, lineCap: .round))
                    .foregroundStyle(.indigo)
                    .frame(width: 200, height: 200)
                        
                RoundedRectangle(cornerRadius: 20)
                    .trim(from: context.start2, to: context.end2)
                    .stroke(style: .init(lineWidth: 6, lineCap: .round))
                    .foregroundStyle(Color.mint)
                    .frame(width: 200, height: 200)
            }
            .onChange(of: ctx.date) { _ in
                if let lastTimeInterval = lastTimeInterval {
                    let elapsedTime = ctx.date.timeIntervalSince1970 - lastTimeInterval
                    
                    progress += elapsedTime * 0.2
                    
                    if progress > 1 {
                        progress = 0
                    }
                }
                
                lastTimeInterval = ctx.date.timeIntervalSince1970
            }
        }
        .onChange(of: progress) { newValue in
            context.updateProgress(newValue)
        }
    }
}

struct TrimBorderAnimationV2: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            TrimV2(isAnimating: $isAnimating)
            
            Button("Start") {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    TrimBorderAnimationV1()
}
