//
//  CheckFightResultLoosView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct CheckFightResultLoosView: View {
    var body: some View {
        VStack {
            Text("You lose")
                .bold()
                .font(.system(size: 21))
            Text("2 - 3")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
        .padding(.top, 26)
    }
}

#Preview {
    CheckFightResultLoosView()
}
