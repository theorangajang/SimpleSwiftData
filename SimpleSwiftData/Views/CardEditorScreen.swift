//
//  CardEditorScreen.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardEditorScreen: View {
    
    @Bindable var card: Card
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        CardContainerScreen {
            VStack(spacing: 0) {
                self.frontLabel
                Divider()
                self.backLabel
            }
            .labeledContentStyle(CardFieldLabeledContentStyle())
            .textFieldStyle(.plain)
            .overlay(alignment: .topTrailing) {
                self.createdAtLabel
            }
        }
        .backgroundStyle(Color.cardFront)
        .defaultFocus(self.$focusedField, .front)
        .padding(.horizontal, Design.carouselCardHorizontalPadding)
    }
    
    private var frontLabel: some View {
        LabeledContent("Front") {
            TextField("Front Text", text: self.$card.front)
                .focused(self.$focusedField, equals: .front)
        }
        .padding()
    }
    
    private var backLabel: some View {
        LabeledContent("Back") {
            TextField("Back Text", text: $card.back)
                .focused($focusedField, equals: .back)
        }
        .padding()
        .background(
            Color.cardBack,
            in: .rect(
                bottomLeadingRadius: Design.cardCornerRadius,
                bottomTrailingRadius: Design.cardCornerRadius)
        )
    }
    
    private var createdAtLabel: some View {
        Text("Created at \(card.creationDate, format: .dateTime)")
            .foregroundStyle(.secondary)
            .font(.footnote)
            .padding()
    }
    
}

/// An enum describing the fields that can be focused in the editor view
private enum FocusedField {
    
    case front
    case back
    
}

/// The standard layout for the fields in the editor view.
private struct CardFieldLabeledContentStyle: LabeledContentStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .textCase(.uppercase)
                .font(.subheadline.bold())
                .foregroundStyle(.secondary)
            Spacer()
            configuration.content
                .font(Design.cardViewingFont)
                .multilineTextAlignment(.center)
                .padding(2)
                .background(.fill.quaternary, in: .rect(cornerRadius: 4))
            Spacer()
        }
    }
    
}
