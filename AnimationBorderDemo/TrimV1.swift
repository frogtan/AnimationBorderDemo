//
//  Trim.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/28.
//

import SwiftUI

final class TrimDataContext: ObservableObject {
    @Published var start1: CGFloat = 0
    @Published var end1: CGFloat = 0
    @Published var start2: CGFloat = 0
    @Published var end2: CGFloat = 0
    
    private let totalLength = 0.25
    
    func updateProgress(_ progress: CGFloat) {
        if progress + totalLength <= 1 {
            start1 = progress
            end1 = progress + totalLength
            
            start2 = 0
            end2 = 0
        } else {
            let part2Length = progress + totalLength - 1
            let part1Length = totalLength - part2Length
            
            start1 = 1 - part1Length
            end1 = 1
            
            start2 = 0
            end2 = part2Length
        }
    }
}

struct TrimConainerV1: View {
    struct TrimV1: View, Animatable {
        @StateObject var context = TrimDataContext()
        var progress: CGFloat = 0.0

        var animatableData: CGFloat {
            get { progress }
            set {
                progress = newValue
            }
        }

        var body: some View {
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
            .onChange(of: progress) { newValue in
                context.updateProgress(newValue)
            }
        }
    }
    
    @Binding var isAnimating: Bool
    @State private var progress: CGFloat = 0
    
    var body: some View {
        TrimV1(progress: progress)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        progress = 1
                    }
                }
            }
    }
}


struct TrimBorderAnimationV1: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            TrimConainerV1(isAnimating: $isAnimating)
            
            Button("Start"){
                isAnimating.toggle()
            }
        }
        
    }
}

#Preview {
    TrimBorderAnimationV1()
}
