//
//  FightLoadViewModel.swift
//  EPIC RPS
//
//  Created by Denis Gindulin on 09.06.24.
//

import Foundation
import SwiftUI

final class FightLoadViewModel: ObservableObject {
    @Published var firstPlayerVictoriesAmount = 0
    @Published var firstPlayerLoseAmount = 0
    
    @Published var secondPlayerVictoriesAmount = 0
    @Published var secondPlayerLoseAmount = 0
    private let storage = StoreageManager()
    
    init() {
        firstPlayerVictoriesAmount = storage.int(forKey: .playerOneCountWinsGames) ?? 0
        firstPlayerLoseAmount = storage.int(forKey: .playerOneCountLooseGames) ?? 0
        secondPlayerVictoriesAmount = storage.int(forKey: .playerTwoCountWinsGames) ?? 0
        secondPlayerLoseAmount = storage.int(forKey: .playerTwoCountLooseGames) ?? 0
    }
}
