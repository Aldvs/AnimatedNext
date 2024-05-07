//
//  ContentView.swift
//  AnimatedButtons
//
//  Created by admin on 05.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isClicked = false
    var body: some View {
        VStack{
            Button(action: {
                withAnimation(Animation.smooth(duration: 0.5, extraBounce: 0.5)){
                    isClicked = true
                }
            completion:{
                isClicked = false
            }
            }) {
                HStack(spacing: .zero) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: isClicked ? 50 : 0, height: isClicked ? 50 : 0)
                        .opacity(isClicked ? 1 : 0)
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: isClicked ? 1 : 50, height: isClicked ? 1 : 50)
                        .opacity(isClicked ? 0 : 1)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
