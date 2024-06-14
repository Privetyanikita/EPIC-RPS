import Foundation
import SwiftUI

final class FightResultViewModel: ObservableObject {
    
    @Published var onePlayer = 0
    @Published var twoPlayer = 0
    
    private var resultGame: GameModel {
        didSet {
            onePlayer = self.resultGame.player1Wins
            twoPlayer = self.resultGame.player2Wins
        }
    }
    
    init(resultGame: GameModel) {
        self.resultGame = resultGame
    }
        
    @ViewBuilder
    func playerImage() -> some View {
        if onePlayer > twoPlayer {
            ImageFightResultView()
        } else {
            ImageFightResultLoosView()
        }
    }
    
    @ViewBuilder
    func checkResultGame() -> some View {
        if onePlayer > twoPlayer {
            CheckFightResultView(viewModel: FightResultViewModel(resultGame: resultGame))
        } else {
            CheckFightResultLoosView(viewModel: FightResultViewModel(resultGame: resultGame))
        }
    }
    
    @ViewBuilder
    func backgroundResult() -> some View {
        if onePlayer > twoPlayer {
            BackgroungResultView()
        } else {
            BackgroundRsultLoseView()
        }
    }
}
