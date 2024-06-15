//
//  FightLoadView.swift
//  EPIC RPS
//
//  Created by Denis Gindulin on 09.06.24.
//

import SwiftUI

struct FightLoadView: View {
    @ObservedObject var fLViewModel = FightLoadViewModel(resultGame: GameModel())

    @State private var gameViewIsOn = false
    
    var body: some View {
 //       NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    PlayerStatisticView(
                        imageName: "AlienEmoji",
                        imageWidth: 87,
                        imageHeight: 100.47,
                        victoriesAmount: fLViewModel.firstPlayerVictoriesAmount,
                        loseAmount: fLViewModel.firstPlayerLoseAmount
                    )
                    Spacer()
                    VSView()
                    Spacer()
                    PlayerStatisticView(
                        imageName: "SportRedEmoji",
                        imageWidth: 85.65,
                        imageHeight: 99.52,
                        victoriesAmount: fLViewModel.secondPlayerVictoriesAmount,
                        loseAmount: fLViewModel.secondPlayerLoseAmount
                    )
                    Spacer()
                    GetReadyView()
//                    Spacer()
//                    NavigationLink(destination: GameView(), isActive: $gameViewIsOn) {
//                        EmptyView()
//                    }
                }
                .fullScreenCover(isPresented: $gameViewIsOn) { GameView() }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.gameViewIsOn = true
                }
        }
       
  //      }
    }
}

#Preview {
    FightLoadView()
}
        
