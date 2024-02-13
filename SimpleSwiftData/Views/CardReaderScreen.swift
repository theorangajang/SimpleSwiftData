//
//  CardReaderScreen.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct CardReaderScreen: View {
    let color: Color
    let text: String
    var displaysCode: Bool = false

    var body: some View {
        CardContainerScreen {
            Text(text)
                .font(Design.cardViewingFont)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.33)
                .padding()
                .fontDesign(displaysCode ? .monospaced : .default)
        }
        .backgroundStyle(color)
    }
}
