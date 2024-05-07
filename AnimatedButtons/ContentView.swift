//
//  ContentView.swift
//  AnimatedButtons
//
//  Created by admin on 05.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        InfiniteScrollView()
    }
}

struct InfiniteScrollView: View {
    @State private var isVisible = false
    
    var body: some View {
        VStack() {
            HStack(spacing: 0) {
                if !isVisible {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.red)
                        .offset(x: -12.5)
                        .transition(
                            .move(edge: .leading)
                            .combined(with: .scale)
                            .combined(with: .opacity)
                        )
                }
                if isVisible {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.tint)
                        .transition(
                            .move(edge: .trailing)
                        )
                }
                if isVisible {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.tint)
                        .transition(
                            .move(edge: .trailing)
                            .combined(with: .scale)
                            .combined(with: .opacity)
                        )
                }
            }
            .frame(width: 50, height: 30)
            .border(.purple, width: 2.0)
            
            Button(action: {
                withAnimation {
                    self.isVisible.toggle()
                }
            }) {
                Text("Анимировать")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .animation(.smooth, value: isVisible)
    }
}

#Preview {
    ContentView()
}
