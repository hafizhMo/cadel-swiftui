//
//  ContentView.swift
//  cadel-swiftui
//
//  Created by Hafizh Mo on 23/01/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: CadelViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 3, content: {
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[0])
            })
            .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
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
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(CadelViewModel())
    }
}
