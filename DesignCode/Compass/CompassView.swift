//
//  CompassView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 13.03.24.
//

import SwiftUI
import CoreLocationUI

struct CompassView: View {
    @State var location: CGPoint = .zero
    @State var isDragging = false
    @State var show = false
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        ZStack {
            background
            outerCircles
                .rotation3DEffect(.degrees(show ? 26 : 0), axis: (x: 1.0, y: 0.0, z: 0.0))
            innerCircles
                .rotation3DEffect(.degrees(show ? 15 : 0), axis: (x: 1.0, y: 0.0, z: 0.0))
            waypoints
                .rotationEffect(.degrees(locationManager.degrees))
                .scaleEffect(show ? 0.9 : 1)
            if !show { flashlight }
            circleLabel
                .rotation3DEffect(.degrees(show ? 10 : 0), axis: (x: 1.0, y: 0.0, z: 0.0))
            strokes
                .rotationEffect(.degrees(locationManager.degrees))
                .rotation3DEffect(.degrees(show ? 10 : 0), axis: (x: 1.0, y: 0.0, z: 0.0))
            light
            title
            sheet.animation(.easeOut(duration: 0.5), value: show)
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
        .gesture(drag)
    }

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                location = value.location
                isDragging = true
            }
            .onEnded { value in
                isDragging = false
            }
    }

    var sheet: some View {
        CompassSheet()
            .background(.ultraThinMaterial)
            .cornerRadius(50)
            .offset(y: show ? 340 : 1000)
    }

    var title: some View {
        VStack {
            Text("\(String(format: "%.0f", locationManager.degrees))° \(compassDirection(locationManager.degrees))")
                .font(.largeTitle)
            Text("San Francisco".uppercased())
                .font(.footnote)
            if let myLocation = locationManager.location {
                Text("Latitude: \(myLocation.latitude.formatted(.number.precision(.fractionLength(2)))), Longitude: \(myLocation.longitude.formatted(.number.precision(.fractionLength(2))))")
            } else {
                LocationButton {
                    locationManager.requestLocation()
                }
                .labelStyle(.iconOnly)
                .cornerRadius(20)
            }
        }
        .fontWeight(.medium)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    var waypoints: some View {
        ZStack {
            Circle()
                .fill(.blue)
                .frame(width: 16)
                .offset(x: 100, y: 210)
            Circle()
                .fill(.red)
                .frame(width: 16)
                .offset(x: -120, y: -200)
            Circle()
                .fill(.green)
                .frame(width: 16)
                .offset(x: 100, y: -150)
        }
    }

    var flashlight: some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .fill(.radialGradient(colors: [.white.opacity(0.1), .clear], center: .center, startRadius: 0, endRadius: 200))
                    .offset(x: location.x-proxy.size.width/2, y: location.y-proxy.size.height/2)
                    .opacity(isDragging ? 1 : 0)
                Circle()
                    .fill(.radialGradient(colors: [.white, .clear], center: .center, startRadius: 0, endRadius: 200))
                    .offset(x: location.x-proxy.size.width/2, y: location.y-proxy.size.height/2)
                    .opacity(isDragging ? 1 : 0)
                    .mask(
                        ZStack {
                            Circle().stroke().scaleEffect(1.2)
                            Circle().stroke().scaleEffect(1.5)
                            Circle().stroke().padding(20)
                            Circle().stroke().padding(80)
                            Circle().stroke().padding(100)
                            Circle().stroke().padding(120)
                            Circle().stroke().padding(145)
                            Circle().stroke().padding(170)
                            Group {
                                Text("Home")
                                    .offset(x: 0, y: -210)
                                    .rotationEffect(.degrees(-31))
                                Text("Tent")
                                    .rotationEffect(.degrees(35))
                                    .offset(x: 115, y: -170)
                                Text("Parked Car")
                                    .rotationEffect(.degrees(150))
                                    .offset(x: 80, y: 190)
                                Text("N")
                                    .rotationEffect(.degrees(0))
                                    .offset(x: 0, y: -135)
                                Text("E")
                                    .rotationEffect(.degrees(90))
                                    .offset(x: 135, y: 0)
                                Text("S")
                                    .rotationEffect(.degrees(180))
                                    .offset(x: 0, y: 135)
                                Text("W")
                                    .rotationEffect(.degrees(270))
                                    .offset(x: -135, y: 0)
                            }
                            .rotationEffect(.degrees(locationManager.degrees))
                        }
                            .frame(width: 393)
                    )
            }
            .frame(
                width: proxy.frame(in: .global).width,
                height: proxy.frame(in: .global).height
            )
        }
    }

    var circleLabel: some View {
        CircleLabelView(diameter: 225).foregroundColor(.white)
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
            outerCircle.scaleEffect(show ? 1.5 : 1.2)
            outerCircle.scaleEffect(show ? 2 : 1.5)
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
