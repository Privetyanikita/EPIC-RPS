//
//  TimerView.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/11/24.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .frame(height: 250)
            .foregroundColor(.timerBlue)
            .overlay(Color.black.opacity(0.5)).cornerRadius(14)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 14) // это растущая полоска
                    .fill(.green)
                    .frame(width: 20, height: 250 * (configuration.fractionCompleted ?? 0))
            }
    }
}

struct TimerView: View {
    
    var progress: Double
    var totalValue: Double
 
    
    private func timeString(from seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }

    var body: some View {
        VStack {
            ProgressView("\(progress)", value: progress, total: totalValue)
                .frame(width: 20)
                .progressViewStyle(RoundedRectProgressViewStyle())
            Text("\(timeString(from: Int(totalValue  - progress)))")
                .foregroundStyle(.white)
                .frame(width: 50)
        }
    }

}
