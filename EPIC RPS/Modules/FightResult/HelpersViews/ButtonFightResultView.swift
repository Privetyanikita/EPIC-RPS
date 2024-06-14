//
//  ButtonView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 09.06.2024.
//

import SwiftUI

struct ButtonFightResultView: View {
    var body: some View {
        HStack(spacing: 42) {
            NavigationLink(destination: HomeView()) {
                Image("homeButton")
            }
            NavigationLink(destination: GameView()) {
                Image("reButton")
            }
        }
        .padding(.top, 34)
    }
}

#Preview {
    ButtonFightResultView()
}
