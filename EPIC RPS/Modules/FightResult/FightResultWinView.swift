//
//  FightResult.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct FightResultWinView: View {
    var body: some View {
        ZStack {
            Image("BackgroundBlueBlurred")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ImageFightResultView()
                CheckFightResultView()
                ButtonFightResultView()
            }
        }
    }
}

#Preview {
    FightResultWinView()
}
