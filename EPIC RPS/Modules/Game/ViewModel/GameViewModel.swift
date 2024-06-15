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
        case player2 // комп / или второй человек
    }

    @Published var game = GameModel()
    var timer: Timer?
    private var soundPlayer: AVAudioPlayer?
    private var musicPlayer: AVAudioPlayer?
    private var musicName: String
    private var nextPlayerButtonPress: Bool = false
    private var tempChoice1: Choice?
    private var tempChoice2: Choice?
    
    @Published var showResult: Bool = false
    @Published var showFightResultView: Bool = false
    
    private var storage = StoreageManager()
    
    init() {
        let isTwoPlayer =  storage.bool(forKey: .twoPlayer) ?? false
        let musicName = storage.string(forKey: .melody) ?? "BattleMusic"
        let time = storage.int(forKey: .time) ?? 30
        self.musicName = musicName
        game.timeRemaining = Double(time)
        game.twoPlayerGame = isTwoPlayer

    }
    
    func chooseGesture(_ gesture: Choice) {
        guard timer?.isValid == true  else { return }
        if  game.twoPlayerGame && tempChoice1 != nil && nextPlayerButtonPress == false {
            return
        }
        
        if !game.twoPlayerGame {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self, gesture]  in
                guard let self = self else { return }
                game.player1Choice = gesture
                self.playSound(named: gesture.rawValue)
                choiceVirtualPlayer()
                self.determineWinner()
            }
        } else {
            if tempChoice1 == nil {
                tempChoice1 = gesture
            } else {
                tempChoice2 = gesture
            }
            if tempChoice1 != nil && tempChoice2 != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self]  in
                    guard let self = self else { return }
                    self.game.player1Choice = self.tempChoice1
                    self.game.player2Choice = self.tempChoice2
                    
                    self.determineWinner()
                    self.tempChoice1 = nil
                    self.tempChoice2 = nil
                }
            }
        }
       
    }
    
    func choiceVirtualPlayer() {
        
        let gestures = Choice.allCases
        game.player2Choice = gestures.randomElement()
    }
    
    func clearAllAV() {
        soundPlayer = nil
        musicPlayer = nil
        timer?.invalidate()
        timer = nil
    }
    
    func sayScore() {
        print(game.player2Wins)
        print(game.player1Wins)
        
    }
    func nextPlayer() {
        nextPlayerButtonPress = true
    }

    func determineWinner() {
        guard let player1Choice = game.player1Choice,
              let player2Choice = game.player2Choice else { return }

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

      
        timer?.invalidate()
        if game.player1Wins == 3 || game.player2Wins == 3 {
            musicPlayer?.stop()
            // Navigate to ResultView
            showFightResultView = true
        } else {
            showResult = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self]  in
                guard let self = self else {return}
                self.game.player1Choice = nil
                self.game.player2Choice = nil
                self.nextPlayerButtonPress = false
                self.showResult = false
                self.startTimer(true)
            }
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
                }
            case .player1:
                switch player1Choice {
                    case .rock:
                        return "maleHandRock"
                    case .paper:
                        return "maleHandPaper"
                    case .scissors:
                        return "maleHandScissors"
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
    
    func sendScore() -> GameModel {
        var  gameModel = GameModel()
        gameModel.player1Wins = game.player1Wins
        gameModel.player2Wins = game.player2Wins
        return gameModel
    }
    
    
     func playMusic() {
      
         if let musicPlayer = musicPlayer, musicPlayer.isPlaying {
             musicPlayer.stop()
         }
        guard let soundURL = Bundle.main.url(forResource: musicName, withExtension: "wav") else { return }
        
         do {
             try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
             musicPlayer = try AVAudioPlayer(contentsOf: soundURL, fileTypeHint: AVFileType.mp3.rawValue)
                 
             guard let musicPlayer = musicPlayer else { return }
             musicPlayer.play()
         } catch let error {
             print(error.localizedDescription)
             }
    }
    
    func stopMusic(){
        if let musicPlayer = musicPlayer, musicPlayer.isPlaying {
            musicPlayer.stop()
        }
    }

    deinit {
        timer?.invalidate()
    }
}
