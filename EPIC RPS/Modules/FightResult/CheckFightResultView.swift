//
//  CheckFightResultView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct CheckFightResultView: View {
    var body: some View {
        VStack {
            Text("You win")
                .bold()
                .font(.system(size: 21))
                .foregroundStyle(.youwin)
            Text("3 - 1")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
        .padding(.top, 26)
    }
}

#Preview {
    CheckFightResultView()
}
