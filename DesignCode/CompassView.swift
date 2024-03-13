//
//  CompassView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 13.03.24.
//

import SwiftUI

struct CompassView: View {
    var body: some View {
        ZStack {
            background
            outerCircles
            innerCircles
            strokes
            light
        }
    }

    var light: some View {
        Circle()
            .trim(from: 0.6, to: 0.9)
            .stroke(.radialGradient(colors: [.white.opacity(0.2), .clear], center: .center, startRadius: 0, endRadius: 200), lineWidth: 200)
            .frame(width: 200)
    }

    var innerCircles: some View {
        ZStack {
            innerCircle.padding(20)
            innerCircle2.padding(80)
            innerCircle3.padding(100)
            innerCircle4.padding(120)
            innerCircle4.padding(145)
            innerCircle4.padding(170)
            innerCircle5.padding(188)
        }
        .frame(width: 393)
    }

    var innerCircle: some View {
        Circle()
            .foregroundStyle(
                .linearGradient(colors: [Color(#colorLiteral(red: 0.01999973133, green: 0.0398761332, blue: 0.04805617034, alpha: 1)), Color(#colorLiteral(red: 0.2579306364, green: 0.2629095018, blue: 0.3013115823, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.inner(color: .white.opacity(0.25), radius: 0, x: 1, y: 1))
                .shadow(.drop(color: .black.opacity(0.25), radius: 0, x: 1, y: 1)))
    }

    var innerCircle2: some View {
        Circle()
            .foregroundStyle(
                .linearGradient(colors: [Color(#colorLiteral(red: 0.09227012843, green: 0.1022799984, blue: 0.1445720494, alpha: 1)), Color(#colorLiteral(red: 0.05302359909, green: 0.06306096911, blue: 0.1219055429, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.inner(color: .white.opacity(0.25), radius: 0, x: 1, y: 1))
                .shadow(.drop(color: .black.opacity(0.25), radius: 0, x: 1, y: 1)))
    }

    var innerCircle3: some View {
        Circle()
            .foregroundStyle(
                .radialGradient(colors: [Color(#colorLiteral(red: 0.02480039187, green: 0.03971364722, blue: 0.1230421141, alpha: 1)), Color(#colorLiteral(red: 0.2627436519, green: 0.2627462149, blue: 0.3139830828, alpha: 1))], center: .center, startRadius: 0, endRadius: 100)
                .shadow(.inner(color: .white.opacity(0.25), radius: 0, x: 1, y: 1))
                .shadow(.drop(color: .black.opacity(0.25), radius: 0, x: 1, y: 1)))
    }

    var innerCircle4: some View {
        Circle()
            .foregroundStyle(
                .linearGradient(colors: [.black.opacity(0.5), .black.opacity(0.0)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.inner(color: .white.opacity(0.5), radius: 0, x: 1, y: 1))
                .shadow(.drop(color: .black.opacity(0.5), radius: 0, x: 1, y: 1)))
    }

    var innerCircle5: some View {
        Circle()
            .foregroundStyle(.white)
    }

    var outerCircles: some View {
        ZStack {
            outerCircle.scaleEffect(1.2)
            outerCircle.scaleEffect(1.5)
        }
        .frame(width: 393)
    }

    var outerCircle: some View {
        Circle()
            .foregroundStyle(.linearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(.inner(color: .white.opacity(0.5), radius: 0, x: 0.5, y: 0.5))
            )
    }

    var background: some View {
        RadialGradient(colors: [Color(#colorLiteral(red: 0.231372549, green: 0.2352941176, blue: 0.368627451, alpha: 1)), .black], center: .center, startRadius: 1, endRadius: 400)
            .ignoresSafeArea()
    }

    var strokes: some View {
        ZStack {
            Circle().strokeBorder(gradient, style: StrokeStyle(lineWidth: 5, dash: [1, 1]))
            Circle().strokeBorder(gradient, style: StrokeStyle(lineWidth: 10, dash: [1, 6]))
            Circle().strokeBorder(gradient, style: StrokeStyle(lineWidth: 15, dash: [1, 62]))
        }
        .frame(width: 315)
    }

    var gradient: LinearGradient {
        LinearGradient(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6274509804, blue: 0.7098039216, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    CompassView()
}
