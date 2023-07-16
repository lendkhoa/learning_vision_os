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
    @State private var rotationAngle: Double = 0.0
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
                    satellite.scale = [0.001, 0.001, 0.001]
                    print(" MinExtent \(minExtent)")
                    
                    content.add(earth)
                    content.add(satellite)
                    earth.position = [0, 0, 0]
                    satellite.position = [0, 0.5, 0.9]
                    
                    // add animation
                    
                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                        rotationAngle += 0.05 // Adjust the rotation speed here
                        earth.orientation = simd_quatf(angle: Float(rotationAngle), axis: [0, 1, 0])
                    }
                    
                    // Playing a transform animation
                    let satelliteOrbit = OrbitAnimation(name: "Orbit",
                                                        duration: 15,
                                                        axis: [0.09, 0, 0.04],
                                                        startTransform: satellite.transform,
                                                        bindTarget: .transform,
                                                        repeatMode: .repeat)
                    
                    if let animation = try? AnimationResource.generate(with: satelliteOrbit) {
                        satellite.playAnimation(animation)
                    }
                }
            }
        }
    }
}


#Preview {
    OrbitView().previewLayout(.sizeThatFits)
}
