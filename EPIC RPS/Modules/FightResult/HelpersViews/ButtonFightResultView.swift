//
//  ButtonView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 09.06.2024.
//

import SwiftUI

struct ButtonFightResultView: View {
    @State  var isHome: Bool = false
    @State  var isGame: Bool = false
    
    var body: some View {
        HStack(spacing: 42) {
           
            Button {
                isHome = true
            } label: {
                Image("homeButton")
            }

            Button {
                isGame = true
            } label: {
                Image("reButton")
            }
               
            
            
        }
        .padding(.top, 34)
        .fullScreenCover(isPresented: $isHome) {
            HomeView()
                            }
        .fullScreenCover(isPresented: $isGame) {
            GameView()
                            }
    }
}

#Preview {
    ButtonFightResultView()
}
