//
//  BackgroungResultView.swift
//  EPIC RPS
//
//  Created by Дмитрий Трушин on 13.06.2024.
//

import SwiftUI

struct BackgroungResultView: View {
    var body: some View {
        ZStack {
            Image("BackgroundBlueBlurred")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroungResultView()
}
