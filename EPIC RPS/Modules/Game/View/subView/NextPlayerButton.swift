//
//  NextPlayerButton.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/14/24.
//

import SwiftUI

struct NextPlayerButton: View {
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image("RandomSelector")
                .resizable()
                .frame(width: 100 , height: 60)
        }
    }
    
    //#Preview {
    //    NextPlayerButton()
}
