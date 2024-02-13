//
//  CardContainerScreen.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardContainerScreen<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
            content
                .foregroundStyle(Color.cardText)
        }
        .aspectRatio(2, contentMode: .fit)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
