//
//  ButtonView.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/11/24.
//

import SwiftUI


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
