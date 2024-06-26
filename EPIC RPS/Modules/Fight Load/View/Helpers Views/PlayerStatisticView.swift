//
//  PlayerStatisticView.swift
//  EPIC RPS
//
//  Created by Денис Гиндулин on 11.06.2024.
//

import SwiftUI

struct PlayerStatisticView: View {
    let imageName: String
    let imageWidth: Double
    let imageHeight: Double
    let victoriesAmount: Int
    let loseAmount: Int
    
    var body: some View {
        VStack {
            PlayerAvatarView(imageName: imageName, width: imageWidth, height: imageHeight)
            HStack {
                Text(victoriesAmount.formatted())
                    .fontWeight(.heavy)
                    .foregroundStyle(.youwin)
                Text("Victories/")
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
            HStack {
                Text(loseAmount.formatted())
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                Text("Lose")
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
        }
        .font(.system(size: 21))
        

        
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        PlayerStatisticView(
            imageName: "AlienEmoji",
            imageWidth: 87,
            imageHeight: 100.47,
            victoriesAmount: 10,
            loseAmount: 2
        )
    }
}
