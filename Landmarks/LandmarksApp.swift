//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
