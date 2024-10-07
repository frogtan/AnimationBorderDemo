//
//  AnimationBorderDemoApp.swift
//  AnimationBorderDemo
//
//  Created by Frog on 2024/9/23.
//

import SwiftUI

@main
struct AnimationBorderDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("dashPhase V1") {
                        DashPhaseV1()
                    }
                    
                    NavigationLink("dashPhase V2") {
                        DashPhaseV2()
                    }
                    
                    NavigationLink("mask") {
                        Mask()
                    }
                    
                    NavigationLink("mask border animation1") {
                        MaskBorderAnimation1()
                    }
                    
                    NavigationLink("mask border animation2") {
                        MaskBorderAnimation1()
                    }
                    
                    
                    NavigationLink("trim v1") {
                        TrimBorderAnimationV1()
                    }
                    
                    NavigationLink("trim v2") {
                        TrimBorderAnimationV2()
                    }
                }
            }
        }
    }
}


