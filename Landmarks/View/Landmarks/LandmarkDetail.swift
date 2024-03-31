//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmarkData: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmarkData.id})!
    }
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmarkData.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmarkData.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkData.name)
                        .font(.title)
                    Spacer()
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack{
                    Text(landmarkData.park)
                    Spacer()
                    Text(landmarkData.state)
                }
                
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                HStack{
                    Text("About")
                    Text(landmarkData.name)
                        .bold()
                }
                .font(.title2)
                Spacer()
                Text(landmarkData.description)
            }
            .padding()
        }
        .navigationTitle(landmarkData.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmarkData: modelData.landmarks[1])
        .environment(modelData)
}
