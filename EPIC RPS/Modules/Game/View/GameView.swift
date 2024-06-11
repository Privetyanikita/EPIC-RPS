//
//  GameView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = RoundViewModel()
    
    @State private var offsetHand: CGFloat = 800
   
    private var totalHeight: CGFloat = 400.0
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundBlueView()
                
                Image(viewModel.game.player1Choice?.rawValue ?? "femaleHand")
                    .offset(y: offsetHand)
                Image(viewModel.game.player2Choice?.rawValue ?? "maleHand")
                    .offset(y: -offsetHand)
                
                HStack {
                    TimerView(progress: viewModel.game.progress, totalValue: viewModel.game.timeRemaining)
                    Spacer()
                    PointsView(pointPlayer1: viewModel.game.player1Wins, pointPlayer2: viewModel.game.player2Wins)
                }
                .padding([.leading, .trailing])
                
                ButtonsView(selectChoice: viewModel.chooseGesture(_:))
                
                Text(viewModel.game.gameResult ?? "FIGHT")
                    .foregroundStyle(.orange)
                    .font(.headline)
                
            }
            .padding(.bottom, 50)
            .onAppear {
                viewModel.startTimer()
            }
            .onDisappear {
                viewModel.timer?.invalidate()
            }
            .navigationBarTitle(Text("ИГРА"), displayMode: .inline)
            
            .toolbar(content: {
                Button(action: viewModel.pauseTimer, label: {
                    Image(systemName: "pause.circle")
                        .foregroundStyle(.black)
                    
                })
        })
        }
        
    }
}

#Preview {
    GameView()
}
