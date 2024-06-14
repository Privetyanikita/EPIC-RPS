//
//  FightLoadViewModel.swift
//  EPIC RPS
//
//  Created by Denis Gindulin on 09.06.24.
//

import Foundation
import SwiftUI

final class FightLoadViewModel: ObservableObject {
    
//    @Published var firstPlayerWinBeatsInRound = 0
//    @Published var secondPlayerWinBeatsInRound = 0
    
    @Published var firstPlayerVictoriesAmount = 10
//    @Published var firstPlayerVictoriesAmount: Int {
//        if firstPlayerWinBeatsInRound > secondPlayerWinBeatsInRound {
//            firstPlayerVictoriesAmount += 1
//        }
//
//    }
    @Published var firstPlayerLoseAmount = 2
    
    @Published var secondPlayerVictoriesAmount = 23
    @Published var secondPlayerLoseAmount = 1
    
    private var resultGame: GameModel {
        didSet {
            firstPlayerVictoriesAmount = self.resultGame.player1Wins
            secondPlayerVictoriesAmount = self.resultGame.player2Wins
//            firstPlayerWinBeatsInRound = self.resultGame.player1Wins
//            secondPlayerWinBeatsInRound = self.resultGame.player2Wins
        }
    }
    
    init(resultGame: GameModel) {
        self.resultGame = resultGame
    }
}
