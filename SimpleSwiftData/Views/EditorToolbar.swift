//
//  EditorToolbar.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI

struct EditorToolbar: ToolbarContent {
    let isEnabled: Bool
    @Binding var editing: Bool

    var body: some ToolbarContent {
        ToolbarItem {
            if Design.editFeatureEnabled {
                Button {
                    editing.toggle()
                } label: {
                    Image(systemName: editing ? "play" : "pencil" )
                }
                .disabled(!isEnabled)
            } else {
                EmptyView()
            }
        }
    }
}
