//
//  CardGalleryItem.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardGalleryItem<Content: View, S: ShapeStyle>: View {
    
    private let backgroundStyle: S
    private let action: () -> Void
    @ViewBuilder private var label: Content
    
    init(backgroundStyle: S, label: Content, action: @escaping () -> Void) {
        self.backgroundStyle = backgroundStyle
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            CardContainerScreen {
                self.label
                    .font(Design.cardViewingFont)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .padding()
            }
        }
        .backgroundStyle(backgroundStyle)
        .buttonStyle(Design.galleryButtonStyle)
        .padding(Design.galleryItemPadding)
    }
}
