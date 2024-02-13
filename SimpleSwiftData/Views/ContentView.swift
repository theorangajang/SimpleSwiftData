//
//  ContentView.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    @State private var editing = false
    @State private var navigationPath: [Card] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            CardGallery(
                editing: self.$editing,
                cards: self.cards,
                selectCard: { card in
                    withAnimation { self.navigationPath.append(card) }
                },
                addCard: {
                    let newCard = Card(front: "Sample Front", back: "Sample Back")
                    self.modelContext.insert(newCard)
                    withAnimation {
                        self.navigationPath.append(newCard)
                        self.editing = true
                    }
                    
                }
            )
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}

@MainActor
private let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Card.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Card>()).isEmpty {
            SampleDeck.contents.forEach { container.mainContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
