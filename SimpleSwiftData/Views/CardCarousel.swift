//
//  CardCarousel.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardCarousel: View {
    @State private var selectedCardID: Card.ID?
    @FocusState private var focusCardID: Card.ID?
    private let initialCardID: Card.ID

    let editing: Bool
    var cards: [Card]

    init(editing: Bool, cards: [Card], selectedCard: Card) {
        self.editing = editing
        self.cards = cards
        initialCardID = selectedCard.id
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(self.cards) { card in
                        self.cardLayout(for: card)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: self.$selectedCardID)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            self.footerText
        }
        .background()
        .onAppear { selectedCardID = initialCardID }
        .onChange(of: selectedCardID) { focusCardID = $1 }
    }
    
    private func cardLayout(for card: Card) -> some View {
        Group {
            if self.editing {
                CardEditorScreen(card: card)
            } else {
                FlashCard(card: card)
                    .id(card.id)
            }
        }
        .containerRelativeFrame(.horizontal) { width, _ in
            min(width, Design.carouselCardMaxWidth)
        }
        .containerRelativeFrame(.horizontal)
        .focused(self.$focusCardID, equals: card.id)
    }
    
    private var footerText: some View {
        Text("Swipe left/right to review other cards")
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
            .font(.footnote)
    }
    
}

