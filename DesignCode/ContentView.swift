//
//  ContentView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 10.03.24.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            switch selectedMenu {
            case .compass:
                CompassView()
            case .card:
                CardReflectionView()
            case .radial:
                RadialLayoutView()
            case .actionbutton:
                ActionButtonView()
            case .gooey:
                Text("gooey")
            case .charts:
                DetailView()
            case .halfsheet:
                MenuView()
            }
        }
        .overlay(MessageView())
        .onTapGesture {}
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
