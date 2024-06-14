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
    
    func fightResult() -> String {
        let resultWin = "You Win"
        let resultLose = "You Lose"
        if onePlayer > twoPlayer {
            return resultWin
        } else {
            return resultLose
        }
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
