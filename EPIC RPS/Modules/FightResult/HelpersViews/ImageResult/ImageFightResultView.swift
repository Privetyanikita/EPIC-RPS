//
//  ImageView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 09.06.2024.
//

import SwiftUI

struct ImageFightResultView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundCircleBlue)
            Image("SportRedEmoji")
                .resizable()
                .frame(width: 67, height: 78)
        }
        .frame(height: 176)
    }
}

#Preview {
    ImageFightResultView()
}
