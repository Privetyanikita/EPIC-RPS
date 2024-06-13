//
//  GameViewModel.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import Foundation
import AVFoundation


class RoundViewModel: ObservableObject {
    enum NumPlayer {
        case player1 //  человек
        case player2 // комп
    }

    @Published var game = GameModel()
    var timer: Timer?
    var soundPlayer: AVAudioPlayer?
    var musicPlayer: AVAudioPlayer?
    
    func chooseGesture(_ gesture: Choice) {
        guard timer?.isValid == true  else { return }
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self, gesture]  in
            guard let self = self else { return }
            game.player1Choice = gesture
            self.playSound(named: gesture.rawValue)
            self.determineWinner()
        }
       
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
      
        timer?.invalidate()
        if game.player1Wins == 3 || game.player2Wins == 3 {
            musicPlayer?.stop()
            // Navigate to ResultView
        } else {
            startTimer(true)
        }
    }
    
    func returnIconHandName( _ player: NumPlayer) -> String {
        guard let player1Choice = game.player1Choice,
              let player2Choice = game.player2Choice else { return player == .player1 ? "maleHand" : "femaleHand" }
        switch player {
            case .player2:
                switch player2Choice {
                    case .rock:
                       return "femaleHandRock"
                    case .paper:
                        return  "femaleHandPaper"
                    case .scissors:
                        return "femaleHandScissors"
                    case .none:
                        return "femaleHand"
                }
            case .player1:
                switch player1Choice {
                    case .rock:
                        return "maleHandRock"
                    case .paper:
                        return "maleHandPaper"
                    case .scissors:
                        return "maleHandScissors"
                    case .none:
                        return "maleHand"
                }
        }
    }

    func startTimer(_ isRestart: Bool = false) {
       
      
        if isRestart {
            game.progress = 0
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.game.timeRemaining > self.game.progress && !self.game.isPaused {
                self.game.progress += 1
               
            } else {
                timer.invalidate()
                if self.game.progress == self.game.timeRemaining  {
                    self.game.gameResult = "You Lose"
                    self.game.player2Wins += 1
                    self.startTimer(true)
                }
            }

        }
    }

    func pauseTimer() {
        if !game.isPaused {
            game.isPaused = true
            timer?.invalidate()
            
        } else {
            game.isPaused = false
            startTimer()
        }
    }
    
    private func playSound(named soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: soundURL)
            soundPlayer?.play()
        } catch {
            print("Error: Could not play sound \(soundURL)")
        }
    }
    
     func playMusic() {
        
        guard let soundURL = Bundle.main.url(forResource: "BattleMusic" , withExtension: "wav") else { return }
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: soundURL)
            musicPlayer?.numberOfLoops = 100
            musicPlayer?.play()
        } catch {
            print("Error: Could not play sound \(soundURL)")
        }
    }

    deinit {
        timer?.invalidate()
    }
}
