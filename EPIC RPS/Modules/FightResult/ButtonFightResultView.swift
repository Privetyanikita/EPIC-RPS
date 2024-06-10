//
//  ButtonView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 09.06.2024.
//

import SwiftUI

struct ButtonFightResultView: View {
    var body: some View {
        HStack(spacing: 42) {
            Button {
                // action
            } label: {
                Image("homeButton")
            }
            Button {
                // action
            } label: {
                Image("reButton")
            }
        }
        .padding(.top, 34)
    }
}

#Preview {
    ButtonFightResultView()
}
