//
//  PointsView.swift
//  EPIC RPS
//
//  Created by Denis Evdokimov on 6/11/24.
//

import SwiftUI


struct PointsView: View {
    
    let totalHeight: CGFloat = 400
    var pointPlayer1: Int
    var pointPlayer2: Int
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 10, height: totalHeight)
                .foregroundColor(.timerBlue)
                .overlay(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.orange)
                        .frame(width: 10, height: ((totalHeight / 2) * (CGFloat(pointPlayer1) / CGFloat(3))))
                }
            
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.orange)
                        .frame(width: 10, height: ((totalHeight / 2) * (CGFloat(pointPlayer2) / CGFloat(3))))
                }
            
            Image(.alienEmoji)
                .resizable()
                .frame(width: 35, height: 35)
                .offset(y: -totalHeight / 2 )
            
            Image(.batmanEmoji)
                .resizable()
                .frame(width: 35, height: 35)
                .offset(y: totalHeight / 2 )
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 20, height: 1)
            
            
        }
    }
}
