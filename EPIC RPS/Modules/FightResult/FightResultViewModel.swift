import Foundation
import SwiftUI

final class FightResultViewModel: ObservableObject {
    
    @Published var onePlayer = 0
    @Published var twoPlayer = 0
    private let storage = StoreageManager()
    private var firstPlayerWins: Int
    private var secondPlayerWins: Int
    private var firstPlayerLoose: Int
    private var secondPlayerLoose: Int
    
    private var resultGame: GameModel {
        didSet {
            onePlayer = self.resultGame.player1Wins
            twoPlayer = self.resultGame.player2Wins
        }
    }
    
    init(resultGame: GameModel) {
        self.resultGame = resultGame
        self.firstPlayerWins = storage.int(forKey: .playerOneCountWinsGames) ?? 0
        self.secondPlayerWins = storage.int(forKey: .playerTwoCountWinsGames) ?? 0
        self.firstPlayerLoose = storage.int(forKey: .playerOneCountLooseGames) ?? 0
        self.secondPlayerLoose = storage.int(forKey: .playerTwoCountLooseGames) ?? 0
        self.updatePlayerScores()
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
    
    func updatePlayerScores() {
        if onePlayer > twoPlayer {
            firstPlayerWins += 1
            storage.set(object: firstPlayerWins, forKey: .playerOneCountWinsGames)
            secondPlayerLoose += 1
            storage.set(object: secondPlayerLoose, forKey: .playerTwoCountLooseGames)
        } else {
            secondPlayerWins += 1
            storage.set(object: secondPlayerWins, forKey: .playerTwoCountWinsGames)
            firstPlayerLoose += 1
            storage.set(object: firstPlayerLoose, forKey: .playerOneCountLooseGames)
        }
    }
}
