//
//  ImageFightResultLoosView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 10.06.2024.
//

import SwiftUI

struct ImageFightResultLoosView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundCircleBlue)
            Image("AlienEmoji")
                .resizable()
                .frame(width: 67, height: 78)
        }
        .frame(height: 176)
    }
}

#Preview {
    ImageFightResultLoosView()
}
