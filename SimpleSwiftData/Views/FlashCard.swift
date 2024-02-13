//
//  FlashCard.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct FlashCard: View {
    
    @State private var flipped = false

    private var front: Angle { flipped ? .degrees(180) : .degrees(0) }
    private var back: Angle { flipped ? .degrees(0) : .degrees(-180) }
    private var card: Card
    
    init(card: Card) {
        self.card = card
    }

    var body: some View {
        Button {
            withAnimation { flipped.toggle() }
        } label: {
            VStack {
                Spacer(minLength: 0)
                ZStack {
                    CardReaderScreen(color: .cardFront, text: card.front)
                        .horizontalFlip(front, visible: !flipped)
                    CardReaderScreen(color: .cardBack, text: card.back, displaysCode: true)
                        .horizontalFlip(back, visible: flipped)
                }
                Spacer(minLength: 0)
            }
        }
        .buttonStyle(Design.carouselCardButtonStyle)
        .focusEffectDisabled()
        .padding(.horizontal, Design.carouselCardHorizontalPadding)
    }
    
}
