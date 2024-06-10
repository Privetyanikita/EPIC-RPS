//
//  FightResuleLoosView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct FightResuleLoosView: View {
    var body: some View {
        ZStack {
            Image("BackgroundOrangeBlurred")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ImageFightResultLoosView()
                CheckFightResultLoosView()
                ButtonFightResultView()
            }
        }
    }
}

#Preview {
    FightResuleLoosView()
}
