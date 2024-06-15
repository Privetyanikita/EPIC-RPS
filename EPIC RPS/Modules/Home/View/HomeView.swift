//
//  HomeView.swift
//  EPIC RPS
//
//  Created by NikitaKorniuk   on 09.06.24.
//

import SwiftUI

struct HomeView: View {
    @State var showSettings: Bool = false
    @State var showRules: Bool = false
    @State var gameOn: Bool = false
    @State var goAlert: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    showSettings = true
                                }) {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                   showRules = true
                                }) {
                                    Image(systemName: "questionmark.circle.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                }
                
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
                VStack(spacing: 11) {
                    NavigationLink(destination:  FightLoadView(), isActive: $gameOn) {
                       EmptyView()
                    }
                    ZStack{
                        Button {
                           gameOn = true
                        } label: {
                            Image("backgroundButton")
                            
                        }
                        Text("START")
                            .bold()
                            .font(.system(size: 16))
                            .foregroundStyle(Color.brown)
                            .offset(y:-4)
                    }
                    
                    ZStack{
                        Button {
                            goAlert = true
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
        .fullScreenCover(isPresented: $showSettings) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showRules) {
            RulesView()
        }
        .alert("Тут наверное что-то должно было быть (наверное)", isPresented: $goAlert) {
            HStack{
                Button("Ок"){
                   return
                }
            }
        }

    }
}

#Preview {
    HomeView()
}
