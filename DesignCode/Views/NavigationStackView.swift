//
//  NavigationStackView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(navigationItems) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(for: NavigationItem.self) { item in
                switch item.menu {
                case .compass:
                    ContentView()
                case .card:
                    Text(item.title)
                case .radial:
                    Text(item.title)
                case .actionbutton:
                    Text(item.title)
                case .gooey:
                    Text(item.title)
                case .charts:
                    Text(item.title)
                case .halfsheet:
                    Text(item.title)
                }
            }
            .navigationTitle("SwiftUI Apps")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

#Preview {
    NavigationStackView()
}
