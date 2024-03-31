//
//  ContentView.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
    
}
