//
//  CircleImage.swift
//  Landmarks
//
//  Created by Arvin on 18/02/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay{
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("lakemcdonald"))
}
