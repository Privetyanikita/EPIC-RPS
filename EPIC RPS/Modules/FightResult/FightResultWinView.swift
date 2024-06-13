//
//  FightResult.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct FightResultWinView: View {
    
    @ObservedObject var viewModel: FightResultViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                viewModel.backgroundResult()
                VStack {
                    viewModel.playerImage()
                    viewModel.checkResultGame()
                    ButtonFightResultView()
                }
            }
        }
    }
}


#Preview {
    FightResultWinView(viewModel: FightResultViewModel(resultGame: GameModel()))
}
