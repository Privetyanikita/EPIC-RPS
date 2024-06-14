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
    private var resultOffset: CGFloat {
        viewModel.showResult ? 70 : 0
    }
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationView {
                ZStack {
                    BackgroundBlueView()
                    VStack {
                        HStack {
                            Text("Игра")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .opacity(0.3)
                      
                        }
                        Spacer()
                    }.padding(.top, geometry.size.width * 0.2) // 50 / 90
                    Image(viewModel.returnIconHandName(.player2))
                        .offset(x: -50, y: -offsetHand + resultOffset)
                    Image(.blood)
                        .opacity(viewModel.showResult ? 1 : 0)
                    Image(viewModel.returnIconHandName(.player1))
                        .offset(x: 50, y: offsetHand - resultOffset)
                    
                    HStack {
                        TimerView(progress: viewModel.game.progress, totalValue: viewModel.game.timeRemaining)
                        Spacer()
                        PointsView(pointPlayer1: viewModel.game.player1Wins, pointPlayer2: viewModel.game.player2Wins)
                    }
                    .padding([.leading, .trailing])
                    
                    ButtonsView(isTwoPlayer: viewModel.game.twoPlayerGame, selectChoice: viewModel.chooseGesture(_:), nextPlayerAction: viewModel.nextPlayer, geometry: geometry)
                  
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
               .previewDevice(PreviewDevice(rawValue: "iPhone 15"))

            GameView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone se")
                
    }
}
