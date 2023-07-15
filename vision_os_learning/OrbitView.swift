//
//  ImmersiveView.swift
//  vision_os_learning
//
//  Created by Khoa Le on 7/4/23.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct OrbitView: View {
    
    var body: some View {
        GeometryReader3D { geometry in
            RealityView { content in
                
                async let earth = ModelEntity(named: "Earth_1_12756")
                async let satellite = ModelEntity(named: "clipper_spacecraft")
                
                if let earth = try? await earth, let satellite = try? await satellite{
                    let bounds = content.convert(geometry.frame(in: .local),
                                                 from: .local, to: content)
                    let minExtent = bounds.extents.min()
                    earth.scale = [0.004, 0.004, 0.004]
                    satellite.scale = [0.001, 0.002, 0.001]
                    print(" MinExtent \(minExtent)")
                    
                    content.add(earth)
                    content.add(satellite)
                    satellite.position = [-0.4, 1, 0]
                }
            }
        }
    }
}

#Preview {
    OrbitView().previewLayout(.sizeThatFits)
}
