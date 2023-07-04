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
            }
            .navigationTitle("Sidebar")
            .navigationBarItems(trailing:
                                    Button(action: {
                print("Button clicked!")
                //                        openWindow(id:"planet-earth")
                EarthView()
            }) {
                Image(systemName: "plus")
            }
            )
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

