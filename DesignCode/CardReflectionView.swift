//
//  CardReflectionView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 12.03.24.
//

import SwiftUI

struct CardReflectionView: View {
    @State var translation: CGSize = .zero
    @State var isDragging = false

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
                isDragging = true
            }
            .onEnded { value in
                withAnimation {
                    translation = .zero
                    isDragging = false
                }
            }
    }

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 600)
                .overlay(
                    ZStack {
                        Image("Logo 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180)
                        Image("Logo 2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)                        
                        Image("Logo 3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 390, height: 600)
                            .blendMode(.overlay)
                    }
                )
                .overlay(gloss1.blendMode(.softLight))
                .overlay(gloss2.blendMode(.luminosity))
                .overlay(gloss2.blendMode(.overlay))
                .overlay(LinearGradient(colors: [.clear, .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(LinearGradient(colors: [.clear, .white.opacity(0.75), .white.opacity(0.75), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                .overlay(
                    LinearGradient(colors: [Color(#colorLiteral(red: 0.3647058824, green: 0.06666666667, blue: 0.968627451, alpha: 0.5)), Color(#colorLiteral(red: 0.2196078431, green: 0.007843137255, blue: 0.8549019608, alpha: 0.5))], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .blendMode(.overlay)
                )
                .cornerRadius(50)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.black)
                        .offset(y: 50)
                        .blur(radius: 50)
                        .opacity(0.5)
                        .blendMode(.overlay)
                )
                .scaleEffect(0.9)
                .rotation3DEffect(.degrees(isDragging ? 10 : 0), axis: (x: -translation.height, y: translation.width, z: 0)
                )
                .gesture(drag)
        }
        .preferredColorScheme(.dark)
    }

    var gloss1: some View {
        Image("Gloss 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 392)
            )
    }

    var gloss2: some View {
        Image("Gloss 2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 392)
            )
    }
}

#Preview {
    CardReflectionView()
}
