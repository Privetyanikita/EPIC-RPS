//
//  CheckFightResultLoosView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct CheckFightResultLoosView: View {
    
    @ObservedObject var viewModel: FightResultViewModel
    
    var body: some View {
        VStack {
            Text("You Lose")
                .bold()
                .font(.system(size: 21))
            Text("\(viewModel.onePlayer) - \(viewModel.twoPlayer)")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
        .padding(.top, 26)
    }
}

#Preview {
    CheckFightResultLoosView(viewModel: FightResultViewModel(resultGame: GameModel()))
}
