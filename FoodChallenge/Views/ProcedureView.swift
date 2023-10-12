//
//  ProcedureView.swift
//  FoodChallenge
//
//  Created by Rafael on 12/10/23.
//

import Foundation
import SwiftUI

struct ProcedureTabView: View {
    let procedure: [String?]
    
    var body: some View {
        List {
            ForEach(procedure.compactMap { $0 }, id: \.self) { step in
                Text(step)
            }
        }
        .listStyle(PlainListStyle())
    }
}
