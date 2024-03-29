//
//  RadialLayoutView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 12.03.24.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure.walk", "music.note"]
    var numbers = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var isRadial = true
    @State var hour: Double = 0
    @State var minute: Double = 0

    // MARK: - body
    var body: some View {
        let layout = isRadial ? AnyLayout(RadialLayout()) : AnyLayout(CustomLayout())

        ZStack {
            Rectangle()
                .fill(.gray.gradient)
                .ignoresSafeArea()

            clockCase

            layout {
                ForEach(icons, id: \.self) { item in
                    Circle()
                        .frame(width: 44)
                        .foregroundColor(.black)
                        .overlay(Image(systemName: item).foregroundColor(.white))
                }
            }
            .frame(width: 120)

            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item)")
                        .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.black)
                    .offset(x: isRadial ? 0 : 50)
                }
            }
            .frame(width: 240)

            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item * 5)")
                        .font(.system(.caption, design: .rounded))
                    .foregroundColor(.black)
                    .offset(x: isRadial ? 0 : 100)
                }
            }
            .frame(width: 360)

            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [1, 10]))
                .frame(width: 220)

            clockHands
        }
        .onAppear {
            hour = 360
            minute = 360
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isRadial.toggle()
            }
        }
    }

    // MARK: - clock parts
    var clockHands: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.black)
                .frame(width: 8, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke().fill(.white))
                .offset(y: -46)
                .rotationEffect(Angle.degrees(minute))
                .shadow(radius: 5, y: 5)
                .animation(.linear(duration: 10).repeatCount(12, autoreverses: false), value: minute)

            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.black)
                .frame(width: 8, height: 70)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke().fill(.white))
                .offset(y: -32)
                .rotationEffect(Angle.degrees(hour))
                .shadow(radius: 5, y: 5)
                .animation(.linear(duration: 120), value: hour)

            Circle()
                .fill(.white)
                .frame(width: 3)
        }
    }

    var clockCase: some View {
        ZStack {
            Circle()
                .foregroundStyle(
                    .gray
                        .shadow(.inner(color: .gray, radius: 30, x: 30, y: 30))
                        .shadow(.inner(color: .white.opacity(0.2), radius: 0, x: 1, y: 1))
                        .shadow(.inner(color: .black.opacity(0.2), radius: 0, x: -1, y: -1))
                )
                .frame(width: 360)

            Circle()
                .foregroundStyle(
                    .white
                        .shadow(.inner(color: .gray, radius: 30, x: -30, y: -30))
                        .shadow(.drop(color: .black.opacity(0.3), radius: 30, x: 30, y: 30))
                    )
                .frame(width: 320)

            Circle()
                .foregroundStyle(.white.shadow(.inner(color: .gray, radius: 30, x: 30, y: 30)))
                .frame(width: 280)
        }
    }
}

#Preview {
    RadialLayoutView()
}
