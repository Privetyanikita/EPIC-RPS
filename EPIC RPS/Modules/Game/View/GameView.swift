//
//  GameView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = RoundViewModel()
    
    private var offsetHand: CGFloat = 270
    private var totalHeight: CGFloat = 400.0
    private var resultOffset: CGFloat {
        viewModel.showResult ? 70 : 0
    }
    @State var goMainView = false
    @State var showAlert = false
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack() {
                BackgroundBlueView()
              
                    HStack {
                        Button { showAlert = true} label: {
                            Image(systemName: "chevron.left")
                            .foregroundColor(.rulesFont) }
                        Spacer()
                        Text("Игра").font(.largeTitle)
                        Spacer()
                        Button(action: viewModel.pauseTimer, label: {
                            Image(systemName: viewModel.game.isPaused ? "play.circle" : "pause.circle")
                                .foregroundStyle(.black)
                                .scaleEffect(x: 2, y: 2)
                                .padding()
                        })
                    }
                    .padding()
                    .offset(y: -geometry.size.height / 2)
                    
                Image(viewModel.returnIconHandName(.player2))
                    .offset(x: -50, y: -offsetHand + resultOffset - 60)
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
                
                if !viewModel.game.twoPlayerGame {
                    Text(viewModel.game.gameResult ?? "FIGHT")
                        .foregroundStyle(.orange)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom, 50)
            .onAppear {
                viewModel.startTimer()
                viewModel.playMusic()
            }
            .onDisappear {
                viewModel.clearAllAV()
            }
            .fullScreenCover(isPresented: $viewModel.showFightResultView, content: {
                FightResultWinView(viewModel: FightResultViewModel(resultGame: viewModel.sendScore()))
                
            })
            .fullScreenCover(isPresented: $goMainView, content: {
               HomeView()
            })
            .alert("Вернуться на главное меню?", isPresented: $showAlert) {
                HStack{
                    Button("Да"){
                        
                        goMainView = true
                       
                    }
                    Button("Нет") {
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15"))
        
      
        
    }
}
