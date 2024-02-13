//
//  Design.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import Foundation
import SwiftUI

enum Design {
    
    static let galleryGridSize: GridItem.Size = .adaptive(minimum: 200)
    static let galleryGridSpacing: Double = 10
    static let galleryItemPadding: Double = .zero
    static let galleryButtonStyle: some PrimitiveButtonStyle = .plain
    static let editFeatureEnabled: Bool = false
    static let carouselCardButtonStyle: some PrimitiveButtonStyle = .plain
    static let carouselCardHorizontalPadding: Double = 8
    static let carouselCardMaxWidth: Double = .infinity
    static let cardCornerRadius: Double = 8
    static let cardViewingFont: Font = .largeTitle

}
