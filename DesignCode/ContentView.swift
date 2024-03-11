//
//  ContentView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 10.03.24.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @State var selectedMenu: Menu = .compass
    
    var body: some View {
        ZStack {
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("card")
            case .radial:
                Text("radial")
            case .actionbutton:
                Text("actionbutton")
            case .gooey:
                Text("gooey")
            case .charts:
                Text("charts")
            case .halfsheet:
                Text("halfsheet")
            }

            Button("Show Menu") {
                showMenu = true
            }
            .sheet(isPresented: $showMenu) {
                MenuView(selectedMenu: $selectedMenu)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ContentView()
}
