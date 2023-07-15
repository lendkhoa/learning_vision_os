//
//  ContentView.swift
//  vision_os_learning
//
//  Created by Khoa Le on 7/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: EarthView()) {
                    Text("Earth")
                }
                NavigationLink(destination: OrbitView()) {
                    Text("Orbit")
                }
            }
            .navigationTitle("Sidebar")
        } detail: {
            VStack {
                Text("Hello, world")
                
            }
            .navigationTitle("Content")
            .padding()
        }
    }
}



#Preview {
    ContentView()
}

