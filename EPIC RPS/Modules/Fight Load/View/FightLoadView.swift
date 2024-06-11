//
//  FightLoadView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct FightLoadView: View {
    var body: some View {
        ZStack {
            Image("BackgroundBlueBlurred")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image("AlienEmoji")
                    .resizable()
                    .frame(width: 87, height: 100.47)
                
                HStack {
                    Text("10")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.yellow)
                    Text("Victories/")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.white)
                }
                HStack {
                    Text("2")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.red)
                    Text("Lose")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Text("VS")
                    .bold()
                    .font(.system(size: 62))
                    .foregroundStyle(.yellow)
                
                Spacer()

                Image("SportRedEmoji")
                    .resizable()
                    .frame(width: 85.65, height: 99.52)
                
                HStack {
                    Text("23")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.yellow)
                    Text("Victories/")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.white)
                }
                HStack {
                    Text("1")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.red)
                    Text("Lose")
                        .bold()
                        .font(.system(size: 21))
                        .foregroundStyle(.white)
                }
                
                Spacer()

                Text("Get ready...")
                    .bold()
                    .font(.system(size: 21))
                    .foregroundStyle(.yellow)
                Spacer()
            }
        }
    }
}

#Preview {
    FightLoadView()
}
