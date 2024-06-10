//
//  HomeView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    // action
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color.black)
                }
                Spacer()
                Button {
                    // action
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color.black)
                }
            }
            .padding(.horizontal, 21)
            Spacer()
            VStack(spacing: 55){
                HStack {
                    Spacer()
                    Image("maleHandInverse")
                }
                ZStack {
                    Text("EPIC RPS")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.orange.opacity(0.5))
                        .offset(x: 1.5, y: 1.5)
                    Text("EPIC RPS")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.orange)
                }
                HStack {
                    Image("femaleHandInverse")
                    Spacer()
                }
            }
            Spacer()
            VStack(spacing: 11){
                ZStack{
                    Button {
                        // action
                    } label: {
                        Image("backgroundButton")
                            
                    }
                    Text("MAIN")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundStyle(Color.brown)
                        .offset(y:-4)
                }
                
                ZStack{
                    Button {
                        // action
                    } label: {
                        Image("backgroundButton")
                            
                    }
                    Text("RESULT")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundStyle(Color.brown)
                        .offset(y:-4)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
