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

import SwiftUI
import RealityKit

struct Orbit: View {
    let earth: Entity

    var body: some View {
        RealityView { content in
                    async let earth = ModelEntity(named: "Earth")
                    async let moon = ModelEntity(named: "Moon")

                    if let earth = try? await earth, let moon = try? await moon {
                        content.add(earth)
                        content.add(moon)
                        moon.position = [0.5, 0, 0]
                    }
        }
    }
}

//#Preview {
//    Orbit(earth: <#T##Entity#>)
//}

