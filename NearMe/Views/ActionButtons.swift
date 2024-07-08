//
//  ActionButtons.swift
//  NearMe
//
//  Created by Lavkush kumar on 08/07/24.
//

import Foundation
import SwiftUI
import MapKit

struct ActionButtons:View {
    let mapItem: MKMapItem
    
    var body: some View {
        HStack{
            if let phone = mapItem.phoneNumber {
                Button(action: {
                    let numericPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                    makeCall(phone: numericPhoneNumber)
                    
                },  label: {
                    HStack{
                        Image(systemName: "phone.fill")
                        Text("Call")
                    }
                })
                .buttonStyle(.bordered)            
                Button(action: {
                    MKMapItem.openMaps(with: [mapItem])
                    //Action
                }, label: {
                    HStack{
                        Image(systemName: "car.circle.fill")
                        Text("Take me there")
                    }
                })
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
            }
        }
    }
}
#Preview {
    ActionButtons(mapItem: PreviewData.apple)
}
