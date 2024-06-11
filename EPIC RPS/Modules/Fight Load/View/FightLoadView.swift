//
//  FightLoadView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct FightLoadView: View {
    // количество побед и поражений игроков, которое обновляется перед началом игры
    private var playerOneVictoriesAmount = 10
    private var playerOneLoseAmount = 2
    private var playerTwoVictoriesAmount = 23
    private var playerTwoLoseAmount = 1

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                PlayerStatisticView(
                    imageName: "AlienEmoji",
                    imageWidth: 87,
                    imageHeight: 100.47,
                    victoriesAmount: playerOneVictoriesAmount,
                    loseAmount: playerOneLoseAmount
                )
                Spacer()
                VSView()
                Spacer()
                PlayerStatisticView(
                    imageName: "SportRedEmoji",
                    imageWidth: 85.65,
                    imageHeight: 99.52,
                    victoriesAmount: playerTwoVictoriesAmount,
                    loseAmount: playerTwoLoseAmount
                )
                Spacer()
                GetReadyView()
                Spacer()
            }
        }
    }
}

#Preview {
    FightLoadView()
}
