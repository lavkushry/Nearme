//
//  PlaceListView.swift
//  NearMe
//
//  Created by Lavkush kumar on 08/07/24.
//

import Foundation
import SwiftUI
import MapKit


struct PlaceListView: View {
    
    let mapItems: [MKMapItem]
    @Binding var selectedMapItem: MKMapItem?
    private var sortedItems: [MKMapItem] {
        guard let userlocation =  LocationManager.shared.manager.location else {
            return mapItems
        }
        return  mapItems.sorted { lhs ,rhs in
            guard let lhsLocation = lhs.placemark.location ,
                  let rhsLocation  = rhs.placemark.location else {
                return false
            }
            let lhsDistance = userlocation.distance(from: lhsLocation)
            let rhsDistance = userlocation.distance(from: rhsLocation)
            
            return lhsDistance < rhsDistance
        }
    }
    var body: some View {
        List(sortedItems, id:\.self, selection: $selectedMapItem){mapItem in
            PlaceView(mapItem: mapItem)
        }
    }
}

#Preview {
    let apple = Binding<MKMapItem?>(
        get: {PreviewData.apple},
        set: { _  in}
    )

    return PlaceListView(mapItems: [PreviewData.apple], selectedMapItem: apple)
}
