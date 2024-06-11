//
//  GameView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct GameView: View {
    
    @State private var player1: Choice = .none
    @State private var player2: Choice = .none
    @State private var progress: Double = 0
    @State private var result: String = "FIGHT"
    
    @State private var offsetHandPlayer1: CGFloat = 800
    @State private var offsetHandPlayer2: CGFloat = -800
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var totalHeight: CGFloat = 400.0
    
    var body: some View {
        ZStack {
            BackgroundBlueView()
            
            Image("maleHand")
                .offset(y: offsetHandPlayer1)
            Image("femaleHand")
                .offset(y: offsetHandPlayer2)
            
            HStack {
                TimerView(duration: 30)
                Spacer()
                PointView(totalHeight: 400, pointPlayer1: 1, pointPlayer2: 1)
            }
            .padding([.leading, .trailing])
            
            ButtonsView(selectChoice: selectChoice)
            
            Text(result)
                .foregroundStyle(.orange)
                .font(.headline)
            
            
        }
        
    }
    
    // Перенести во viewModel
    func selectChoice(choice: Choice) {
        player1 = choice
        player2 = Choice.allCases.randomElement()!
        determineResult()
        withAnimation {
            offsetHandPlayer1 = 250
            offsetHandPlayer2 = -250
        }
        
    }
    
    func determineResult() {
        if player1 == player2 {
            result = "DRAW"
        } else if player1.beats(player2) {
            result = "YOU WIN"
        } else {
            result = "YOU LOSE"
        }
    }
    
}

#Preview {
    GameView()
}

struct BackgroundBlueView: View {
    var body: some View {
        Image(.backgroundBlue)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .frame(height: 250)
            .foregroundColor(.timerBlue)
            .overlay(Color.black.opacity(0.5)).cornerRadius(14)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 14)
                    .fill(.green)
                    .frame(width: 20, height: 250 * (configuration.fractionCompleted ?? 0))
            }
    }
}

struct TimerView: View {
    @State private var progress: Double = 0
    private let totalValue: Double
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(duration: Double) {
        
        self.totalValue = duration
    }
    var body: some View {
        VStack {
            ProgressView("\(progress)", value: progress, total: totalValue)
                .frame(width: 20)
                .progressViewStyle(RoundedRectProgressViewStyle())
            
                .onReceive(timer) { _ in
                    if progress < totalValue {
                        progress += 1
                    }
                }
            Text("0:\(Int(totalValue  - progress))")
                .foregroundStyle(.white)
                .frame(width: 50)
            
        }
    }
    
    
}

struct PointView: View {
    
    let totalHeight: CGFloat
    @State var pointPlayer1: Int
    @State var pointPlayer2: Int
    
    private let halfHeight: CGFloat
    
    init(totalHeight: CGFloat, pointPlayer1: Int, pointPlayer2: Int) {
        self.totalHeight = totalHeight
        self.pointPlayer1 = pointPlayer1
        self.pointPlayer2 = pointPlayer2
        self.halfHeight = totalHeight / 2
    }
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 10, height: totalHeight)
                .foregroundColor(.timerBlue)
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.orange)
                        .frame(width: 10, height: (halfHeight * (CGFloat(pointPlayer2) / CGFloat(3))))
                }
            
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.orange)
                        .frame(width: 10, height: (halfHeight * (CGFloat(pointPlayer1) / CGFloat(3))))
                }
            
            Image(.alienEmoji)
                .resizable()
                .frame(width: 35, height: 35)
                .offset(y: -totalHeight / 2 )
            
            Image(.batmanEmoji)
                .resizable()
                .frame(width: 35, height: 35)
                .offset(y: totalHeight / 2 )
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 20, height: 1)
            
            
        }
    }
}

enum Choice: String, CaseIterable {
    case rock, paper, scissors, none
    
    func beats(_ other: Choice) -> Bool {
        switch (self, other) {
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
                return true
            default:
                return false
        }
    }
}

struct ChoiceButton: View {
    var choice: Choice
    var action: (Choice) -> Void
    
    var body: some View {
        Button(action: {
            self.action(self.choice)
        }) {
            Image(icon(for: choice))
                .resizable()
                .frame(width: 80 , height: 80)
        }
    }
    
    private func icon(for choice: Choice) -> String {
        switch choice {
            case .rock:
                return "rock"
            case .paper:
                return "paper"
            case .scissors:
                return "scissors"
            default:
                return "hand.wave"
        }
    }
}

struct ButtonsView: View {
    
    var selectChoice: ((Choice)-> Void)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Spacer()
                    ChoiceButton(choice: .rock, action: selectChoice)
                }
                VStack {
                    
                    ChoiceButton(choice: .paper, action: selectChoice)
                    Spacer()
                }
                VStack {
                    Spacer()
                    ChoiceButton(choice: .scissors, action: selectChoice)
                    
                }
            }
            .padding(.bottom, 50)
        }
        .frame(width: 130, height: 270)
        .offset(y: 300)
    }
    
    
}
