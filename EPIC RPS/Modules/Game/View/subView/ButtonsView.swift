//
//  ButtonsView.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/11/24.
//

import SwiftUI

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
