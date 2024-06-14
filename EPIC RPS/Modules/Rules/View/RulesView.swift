//
//  RulesView.swift
//  EPIC RPS
//
//  Created by Denis Chernyatin   on 11.06.24.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.rulesFont)
                            .padding()
                    }
                    Spacer()
                }
                .overlay(
                    Text("Rules")
                        .font(.custom("Rubik", size: 25))
                        .foregroundColor(.rulesFont)
                )
                .padding(.top, topSafeAreaInset)
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    ruleRow(number: "1", text: Text("Игра проводится между игроком и компьютером."))
                    
                    HStack(alignment: .top, spacing: 8) {
                        ruleCircle(number: "2")
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Жесты:")
                                .ruleText()
                            gestureRow(imageName: "rock", text: "Кулак > Ножницы")
                            gestureRow(imageName: "paper", text: "Бумага > Кулак")
                            gestureRow(imageName: "scissors", text: "Ножницы > Бумага")
                        }
                    }
                    
                    ruleRow(number: "3", text: Text("У игрока есть 30 сек. для выбора жеста."))
                    
                    ruleRow(number: "4", text: Text("Игра ведётся до трёх побед одного из участников."))
                    
                    ruleRow(number: "5", text: ruleFifth())
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func ruleRow(number: String, text: Text) -> some View {
        HStack(spacing: 10) {
            ruleCircle(number: number)
            text.ruleText()
        }
    }
    
    func ruleCircle(number: String) -> some View {
        Circle()
            .fill(Color.rulesList)
            .frame(width: 29, height: 29)
            .overlay(
                Text(number)
                    .font(.custom("Dela Gothic One", size: 16))
                    .foregroundColor(.black)
            )
            .ruleShadow()
    }
    
    func gestureRow(imageName: String, text: String) -> some View {
        HStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
            Text(text)
                .ruleText()
        }
    }
    
    func ruleFifth() -> Text {
            let pointsText = Text("500 баллов")
                .foregroundColor(.rulesPurple)
            return Text("За каждую победу игрок получает ") + pointsText + Text(", которые можно посмотреть на доске лидеров.")
        }
    
    private var topSafeAreaInset: CGFloat {
            if let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                return windowScene.windows.first?.safeAreaInsets.top ?? 0
            }
            return 0
    }
}

extension Text {
    func ruleText() -> some View {
        self.font(.custom("Rubik", size: 16))
            .foregroundColor(.rulesFont)
            .ruleShadow()
    }
}

extension View {
    func ruleShadow() -> some View {
        self.shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 4)
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
