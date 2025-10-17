//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2025-07-08.
//

import FontKit
import SwiftUI

struct ContentView: View {

    @State var typeSize: DynamicTypeSize = .medium

    var body: some View {
        NavigationStack {
            List {
                Section("Font Size") {
                    Picker(
                        "Demo Font Size",
                        selection: $typeSize
                    ) {
                        pickerItem("X Small", .xSmall)
                        pickerItem("Small", .small)
                        pickerItem("Medium", .medium)
                        pickerItem("Large", .large)
                        pickerItem("X Large", .xLarge)
                        pickerItem("XX Large", .xxLarge)
                        pickerItem("XXX Large", .xxxLarge)
                        pickerItem("Accessibility 1", .accessibility1)
                        pickerItem("Accessibility 2", .accessibility2)
                        pickerItem("Accessibility 3", .accessibility3)
                        pickerItem("Accessibility 4", .accessibility4)
                        pickerItem("Accessibility 5", .accessibility5)
                    }
                }
                Section("Dynamic Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.dynamic($0, size: 15))
                    }
                }
                Section("Fixed Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.fixed($0, size: 15))
                    }
                }
                Section("Relative Size") {
                    ForEach(CustomFont.openDyslexicFonts) {
                        Text($0.name)
                            .font(.relative($0, size: 15, relativeTo: .body))
                    }
                }
            }
            .dynamicTypeSize(typeSize)
            .navigationTitle("FontKit Demo")
        }
    }
}

private extension ContentView {

    func pickerItem(
        _ title: String,
        _ size: DynamicTypeSize
    ) -> some View {
        Text(title).tag(size)
    }
}

#Preview {
    ContentView()
}
