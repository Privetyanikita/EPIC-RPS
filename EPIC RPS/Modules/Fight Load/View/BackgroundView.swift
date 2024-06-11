//
//  BackgroundView.swift
//  EPIC RPS
//
//  Created by Денис Гиндулин on 11.06.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("BackgroundBlueBlurred")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
