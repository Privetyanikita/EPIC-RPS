//
//  GameView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = RoundViewModel()
    
    private var offsetHand: CGFloat = 270
    private var totalHeight: CGFloat = 400.0
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundBlueView()
                VStack{
                    HStack {
                        Text("Игра")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .opacity(0.3)
                  
                    }
                    Spacer()
                }.padding(.top, 50)
                Image(viewModel.returnIconHandName(.player2))
                    .offset(x: -50, y: -offsetHand)
                Image(viewModel.returnIconHandName(.player1))
                    .offset(x: 50, y: offsetHand)
                
                HStack {
                    TimerView(progress: viewModel.game.progress, totalValue: viewModel.game.timeRemaining)
                    Spacer()
                    PointsView(pointPlayer1: viewModel.game.player1Wins, pointPlayer2: viewModel.game.player2Wins)
                }
                .padding([.leading, .trailing])
                
                ButtonsView(selectChoice: viewModel.chooseGesture(_:))
                
                Text(viewModel.game.gameResult ?? "FIGHT")
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                
            }
            .padding(.bottom, 50)
            .onAppear {
                viewModel.startTimer()
                viewModel.playMusic()
            }
            .onDisappear {
                viewModel.timer?.invalidate()
            }
            
            .toolbar(content: {
                Button(action: viewModel.pauseTimer, label: {
                    Image(systemName: viewModel.game.isPaused ? "play.circle" : "pause.circle")
                        .foregroundStyle(.black)
                        .scaleEffect(x: 2, y: 2)
                        .padding()
                })
        })
            
        }
        
    }
}

#Preview {
    GameView()
}
