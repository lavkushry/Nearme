//
//  SearchOptionsView.swift
//  NearMe
//
//  Created by Lavkush kumar on 08/07/24.
//

import Foundation
import SwiftUI
struct SearchOptionsView: View{
    let searchOptions = ["Restaurants": "fork.knife", "Hotels":"bed.double.fill","Coffee":"cup.and.saucer.fill","Gas":"fuelpump.fill"]
    
    let onSelected: (String) -> Void
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(searchOptions.sorted(by: > ), id: \.0){
                    key, value in
                    Button(action: {
                        onSelected(key)
                        
                    }, label: {
                        HStack{
                            Image(systemName: value)
                            Text(key)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red:236/255,green: 240/255, blue: 241/255, opacity: 1.0))
                    .foregroundStyle(.black)
                    .padding(4)
                }
            }
        }
    }
}

#Preview {
    SearchOptionsView(onSelected: { _ in})
}
