//
//  EarthView.swift
//  vision_os_learning
//
//  Created by Khoa Le on 7/4/23.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct EarthView: View {
    var body: some View {
        VStack {
            Model3D(named: "Earth_1_12756") { model in
                model
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    EarthView()
}
