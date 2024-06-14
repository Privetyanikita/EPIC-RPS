//
//  SettingsView.swift
//  EPIC RPS
//
//  Created by Denis Chernyatin on 6/14/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var gameDuration: Int = 30
    @State private var backgroundMusic: String = "Мелодия 1"
    @State private var playWithFriend: Bool = true
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 30) {
                HStack {
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.rulesFont)
                    }
                    Spacer()
                }
                .overlay(
                    Text("Settings")
                        .font(.custom("Rubik", size: 25))
                        .foregroundColor(.rulesFont)
                )
                .padding(.horizontal, 16)
                
                VStack(spacing: 20) {
                    HStack {
                        Text("ВРЕМЯ ИГРЫ")
                            .font(.custom("Rubik", size: 20))
                        .foregroundColor(.rulesFont)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 60) {
                        Button(action: {
                            gameDuration = 30
                        }) {
                            Text("30 сек.")
                                .font(.custom("Rubik", size: 16))
                                .bold()
                                .padding()
                                .frame(width: 134, height: 40)
                                .background(gameDuration == 30 ? Color.settingButton : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        Button(action: {
                            gameDuration = 60
                        }) {
                            Text("60 сек.")
                                .font(.custom("Rubik", size: 16))
                                .bold()
                                .padding()
                                .frame(width: 134, height: 40)
                                .background(gameDuration == 60 ? Color.settingButton : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .ruleShadow()
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Фоновая музыка")
                            .font(.custom("Poppins-Bold", size: 16))
                            .foregroundColor(.white)
                        Spacer()
                        Text(backgroundMusic)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.settingGray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.settingGray)
                    }
                    .padding(20)
                    .background(.settingButton)
                    .cornerRadius(15)
                    
                    Toggle(isOn: $playWithFriend) {
                        Text("Игра с другом")
                            .font(.custom("Poppins-Bold", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(16)
                    .background(.settingButton)
                    .cornerRadius(15)
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(15)
                .ruleShadow()
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
