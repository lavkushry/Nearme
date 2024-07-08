//
//  SearchBarView.swift
//  NearMe
//
//  Created by Lavkush kumar on 08/07/24.
//

import Foundation
import SwiftUI
struct SearchBarView: View {
    @Binding var search: String
    @Binding var isSearching: Bool
    var body: some View {
        VStack(spacing: -10){
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    isSearching = true
                }
            SearchOptionsView{ searchTerm in
                search = searchTerm
                isSearching = true
            }
            .padding([.leading],10)
            .padding([.bottom],20)
        }
        
    }
}

#Preview {
    SearchBarView(search: .constant("Coffee"), isSearching: .constant(true))
}
