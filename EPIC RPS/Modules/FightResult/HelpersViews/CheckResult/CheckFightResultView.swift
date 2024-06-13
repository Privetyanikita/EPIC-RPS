//
//  CheckFightResultView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct CheckFightResultView: View {
    
    @ObservedObject var viewModel: FightResultViewModel
    
    var body: some View {
        VStack {
            Text("You Win")
                .bold()
                .font(.system(size: 21))
                .foregroundStyle(.youwin)
            Text("\(viewModel.onePlayer) - \(viewModel.twoPlayer)")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
        .padding(.top, 26)
    }
}

#Preview {
    CheckFightResultView(viewModel: FightResultViewModel(resultGame: GameModel()))
}
