//
//  KeyboardView.swift
//  cadel-swiftui
//
//  Created by Hafizh Mo on 23/01/23.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var dm: CadelViewModel
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var middleRowArray = "ASDFGHJKL".map { String($0) }
    var bottomRowArray = "ZXCVBNM".map { String($0) }
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    KeycapsButton(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(middleRowArray, id: \.self) { letter in
                    KeycapsButton(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 65, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                ForEach(bottomRowArray, id: \.self) { letter in
                    KeycapsButton(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 50, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .environmentObject(CadelViewModel())
            .scaleEffect(Global.keyboardScale)
    }
}
