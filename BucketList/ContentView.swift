//
//  ContentView.swift
//  BucketList
//
//  Created by Hakan Aktürk on 12.01.2023.
//
import MapKit
import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked  {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate ) {
                        VStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.red.opacity(0.8))
                            .frame(width: 25, height: 25)
                        }
                        .onTapGesture{
                            viewModel.selectedPlace = location
                        }
                    }
                }
                    .ignoresSafeArea()
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            viewModel.addLocation()
                        }label: {
                            Image(systemName: "plus")
                        }.padding()
                            .background(.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                        Spacer()
                    }
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) {newLocation in
                    viewModel.update(location: newLocation)
                }
        }
        } else {
            Button("Unlock places") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
