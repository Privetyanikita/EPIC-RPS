//
//  PlayerAvatarView.swift
//  EPIC RPS
//
//  Created by Денис Гиндулин on 11.06.2024.
//

import SwiftUI

struct PlayerAvatarView: View {
    let imageName: String
    let width: Double
    let height: Double
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width, height: height)
    }
}

#Preview {
    PlayerAvatarView(
        imageName: "AlienEmoji",
        width: 87,
        height: 100.47
    )
}
