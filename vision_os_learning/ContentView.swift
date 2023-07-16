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
    @State private var showOrbitView = false
    
    var body: some View {
        NavigationView {
            if showOrbitView {
                OrbitView()
            } else {
                NavigationSplitView {
                    List {
                        NavigationLink(destination: EarthView()) {
                            Text("Earth")
                        }
                        Button("Orbit") {
                            showOrbitView = true
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
    }
}



#Preview {
    ContentView()
}

