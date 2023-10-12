//
//  SearchBar.swift
//  FoodChallenge
//
//  Created by Rafael on 11/10/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)

            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(text.isEmpty ? 0 : 1)
                    .padding(.trailing, 8)
            }
            .foregroundColor(Color(.systemGray))
        }
        .padding(.horizontal)
    }
}
