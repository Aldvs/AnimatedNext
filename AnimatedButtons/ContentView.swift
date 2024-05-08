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
struct IconView: View {
    let systemName: String = "play.fill"
    let color: Color
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
//            .frame(width: 25, height: 25)
            .foregroundColor(color)
    }
}
struct InfiniteScrollView: View {
    @State var icons: [IconView] = [
        IconView(color: .blue),
        IconView(color: .red),
        IconView(color: .green)
    ]

    @State private var visibles = [false, true, true]
    @State private var processAnimation = false
    private let transitions: [AnyTransition] = [
        .move(edge: .leading).combined(with: .scale).combined(with: .opacity), // Для первой иконки
        .move(edge: .trailing), // Для второй иконки
        .move(edge: .trailing).combined(with: .scale).combined(with: .opacity) // Для третьей иконки
    ]
    
    var body: some View {
        Button(action: {
            withAnimation {
//                processAnimation.
                self.shiftIcons()
            }
        }) {
            HStack(spacing: 0) {
                ForEach(icons.indices) { index in
                    if self.visibles[index] {
                        self.icons[index]
                        
                            .transition(self.transitions[index])
                    }
                }
            }
            .frame(width: 50, height: 30)
            .border(Color.purple, width: 1.0)
        }
    }
    
    func shiftIcons() {
        let lastIcon = icons.removeLast()
        icons.insert(lastIcon, at: 0)
    }
}
    
#Preview {
    ContentView()
}
