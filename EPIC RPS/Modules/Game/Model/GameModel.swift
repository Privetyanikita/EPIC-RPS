//
//  GameModel.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import Foundation

enum Choice: String, CaseIterable {
    case rock, paper, scissors
    
    func beats(_ other: Choice) -> Bool {
        switch (self, other) {
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
                return true
            default:
                return false
        }
    }
}

struct GameModel {
    var player1Choice: Choice?
    var player2Choice: Choice?
    var gameResult: String?
    var player1Wins = 0
    var player2Wins = 0
    var isPaused = false
    var timeRemaining: Double = 30
    var progress: Double = 0
}
