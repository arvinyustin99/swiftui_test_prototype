//
//  MapView.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    }
}

#Preview {
    MapView(
        coordinate: CLLocationCoordinate2D(
            latitude: -6.2920711,
            longitude: 106.8020888
            )
    )
}
