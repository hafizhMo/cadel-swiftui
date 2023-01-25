//
//  ContentView.swift
//  cadel-swiftui
//
//  Created by Hafizh Mo on 23/01/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: CadelViewModel
    @State private var showHelp = false
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Spacer()
                    VStack(spacing: 3) {
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                        }
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                    Spacer()
                    KeyboardView()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    Spacer()
                }
                .disabled(dm.showStats)
                .navigationBarTitleDisplayMode(.inline)
                .disabled(dm.showStats)
                .overlay(alignment: .top, content: {
                    if let toastText = dm.toastText {
                        ToastView(toastText: toastText)
                            .offset(y: 75)
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showHelp.toggle()
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("CADEL")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button {
                                withAnimation {
                                    dm.currentStat = Statistic.loadStat()
                                    dm.showStats.toggle()
                                }
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
            }
            
            if dm.showStats {
                StatsView()
            }
        }
        .sheet(isPresented: $showHelp) {
            HelpView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(CadelViewModel())
    }
}
