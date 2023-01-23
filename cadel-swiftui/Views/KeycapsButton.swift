//
//  KeycapsView.swift
//  cadel-swiftui
//
//  Created by Hafizh Mo on 23/01/23.
//

import SwiftUI

struct KeycapsButton: View {
    @EnvironmentObject var dm: CadelViewModel
    var letter: String
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 35, height: 50)
                .foregroundColor(.primary)
                .background(dm.keyColors[letter])
        }
        .buttonStyle(.plain)
    }
}

struct KeycapsButton_Previews: PreviewProvider {
    static var previews: some View {
        KeycapsButton(letter: "E")
            .environmentObject(CadelViewModel())
    }
}
