//
//  ButtonsView.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/11/24.
//

import SwiftUI

struct ButtonsView: View {
    var isTwoPlayer: Bool 
    var selectChoice: ((Choice)-> Void)
    var nextPlayerAction: (()->Void)
    var geometry: GeometryProxy
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Spacer()
                    ChoiceButton(choice: .rock, action: selectChoice)
                    Spacer()
                }
                VStack {
                    
                    ChoiceButton(choice: .paper, action: selectChoice)

                    NextPlayerButton { nextPlayerAction() }
                    .opacity( isTwoPlayer ? 1 : 0)
                }
                VStack {
                    Spacer()
                    ChoiceButton(choice: .scissors, action: selectChoice)
                    Spacer()
                    
                }
            }
            .padding(.bottom, 50)
        }
        .frame(width: 130, height: 270)
        .offset(y: ((geometry.size.height) * 0.4)  ) // 270 / 300
   
    }


}
