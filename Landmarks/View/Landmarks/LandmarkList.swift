//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly: Bool = true
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmarkData: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            .padding(.bottom, 0)
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
