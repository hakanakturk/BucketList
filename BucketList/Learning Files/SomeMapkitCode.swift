//
//  SomeMapkitCode.swift
//  BucketList
//
//  Created by Hakan Aktürk on 13.01.2023.
//

import MapKit
import SwiftUI

struct Locationz: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct SomeMapkitCode: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Locationz(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Locationz(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {Text(location.name) } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
                    }
                }
            }
        }
    }
}
