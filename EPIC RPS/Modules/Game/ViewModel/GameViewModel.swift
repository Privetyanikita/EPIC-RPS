//
//  GameViewModel.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import Foundation

class RoundViewModel: ObservableObject {
    @Published var game = GameModel()
    var timer: Timer?
    
    func chooseGesture(_ gesture: Choice) {
        game.player1Choice = gesture
       
        determineWinner()
    }

    func determineWinner() {
        guard let player1Choice = game.player1Choice else { return }

        let gestures = Choice.allCases
        game.player2Choice = gestures.randomElement()

        if let player2Choice = game.player2Choice {
            if player1Choice == player2Choice {
                game.gameResult = "DRAW"
            } else if (player1Choice == .rock && player2Choice == .scissors) ||
                        (player1Choice == .scissors && player2Choice == .paper) ||
                        (player1Choice == .paper && player2Choice == .rock) {
                game.gameResult = "You Win"
                game.player1Wins += 1
            } else {
                game.gameResult = "You Lose"
                game.player2Wins += 1
            }
        }

    
   
        game.player1Choice = nil
        game.player2Choice = nil

        if game.player1Wins == 3 || game.player2Wins == 3 {
            // Navigate to ResultView
            timer?.invalidate()
        }
    }

    func startTimer() {
       // game.timeRemaining = 30
        game.isPaused = false
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.game.timeRemaining > self.game.progress && !self.game.isPaused {
                self.game.progress += 1
               
            } else {
                timer.invalidate()
                if self.game.progress == self.game.timeRemaining  {
                    self.game.gameResult = "You Lose"
                }
            }
           
           
        }
    }

    func pauseTimer() {
        if game.isPaused {
            timer?.invalidate()
        } else {
            startTimer()
        }
    }

    deinit {
        timer?.invalidate()
    }
}
