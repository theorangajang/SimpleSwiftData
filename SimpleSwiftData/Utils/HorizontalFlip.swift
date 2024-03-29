//
//  HorizontalFlip.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import Foundation
import SwiftUI

struct HorizontalFlip: ViewModifier {
    var angle: Angle
    var visible: Bool
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(angle, axis: (x: 0.0, y: 1.0, z: 0.0))
            .opacity(visible ? 1.0 : 0.0)
    }
}

extension View {
    
    func horizontalFlip(_ angle: Angle, visible: Bool) -> some View {
        modifier(HorizontalFlip(angle: angle, visible: visible))
    }
    
}
