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
    
    private let transitions: [AnyTransition] = [
        .move(edge: .leading).combined(with: .scale).combined(with: .opacity), // Для первой иконки
        .move(edge: .trailing), // Для второй иконки
        .move(edge: .trailing).combined(with: .scale).combined(with: .opacity) // Для третьей иконки
    ]
    
    var body: some View {
        VStack {
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
            Button(action: {
                withAnimation {
                    self.shiftIcons()
                }
            }) {
                Text("Анимировать")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .animation(.smooth) // Устанавливаем анимацию для всего VStack
    }
    
    func shiftIcons() {
        let lastIcon = icons.removeLast()
        icons.insert(lastIcon, at: 0)
    }
}


#Preview {
    ContentView()
}
