//
//  CarlGallery.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardGallery: View {
    
    @Binding var editing: Bool
    
    private let selectCard: (Card) -> Void
    private let addCard: () -> Void
    private var cards: [Card]
    
    init(
        editing: Binding<Bool>,
        cards: [Card],
        selectCard: @escaping (Card) -> Void,
        addCard: @escaping () -> Void
    ) {
        self._editing = editing
        self.selectCard = selectCard
        self.addCard = addCard
        self.cards = cards
    }

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(Design.galleryGridSize)],
                spacing: Design.galleryGridSpacing
            ) {
                CardGalleryItem(
                    backgroundStyle: .fill.tertiary,
                    label: self.addCardLabel,
                    action: self.addCard
                )
                .shadow(radius: 2)

                ForEach(cards) { card in
                    CardGalleryItem(
                        backgroundStyle: Color.cardFront,
                        label: Text(card.front),
                        action: {
                            selectCard(card)
                        }
                    )
                }
            }
        }
        .scrollClipDisabled()
        .navigationDestination(for: Card.self) { [editing] selectedCard in
            CardCarousel(editing: editing, cards: cards, selectedCard: selectedCard)
                .onDisappear { $editing.wrappedValue = false }
        }
    }
    
    private var addCardLabel: some View {
        LabeledContent("Add Card") {
            Image(systemName: "plus")
                .imageScale(.large)
        }
        .labelsHidden()
    }
}
