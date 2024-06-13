//
//  BackgroundRsultLoseVoew.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 13.06.2024.
//

import SwiftUI

struct BackgroundRsultLoseView: View {
    var body: some View {
        ZStack {
            Image("BackgroundOrangeBlurred")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundRsultLoseView()
}
