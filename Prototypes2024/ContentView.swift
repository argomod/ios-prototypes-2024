//
//  ContentView.swift
//  Prototypes2024
//
//  Created by Matt Argomaniz on 7/31/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink(
            "Custom Context Menu",
            destination:
              CustomContextMenuDemo()
              .navigationTitle("Custom Context Menu")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Tooltip reading order",
            destination:
              TooltipReadingOrderDemo()
              .navigationTitle("Tooltip reading order")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Story headline length adjustment",
            destination:
              StoryHeadlineLengthAdjustment()
              .navigationTitle("Story headline length adjustment")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Custom List Item",
            destination:
              CustomListItemDemo()
              .navigationTitle("Custom List Item")
              .navigationBarTitleDisplayMode(.inline)
          )
          NavigationLink(
            "Dynamic Type techniques",
            destination:
              DynamicTypeDemos()
              .navigationTitle("Dynamic Type techniques")
              .navigationBarTitleDisplayMode(.inline)
          )
        } footer: {
          Text("Thank you for checking these out. ♥︎")
        }
      }
      .navigationTitle("Prototypes (2024)")
    }
    .accentColor(.orange)
  }
}

#Preview {
  ContentView()
}
