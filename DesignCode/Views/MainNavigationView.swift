//
//  MainNavigationView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 21.03.24.
//

import SwiftUI

struct MainNavigationView: View {
    var body: some View {
        NavigationView {
            List(navigationItems) { item in
                NavigationLink(destination: destinationView(for: item)) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationTitle("SwiftUI Apps")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }

    @ViewBuilder
    private func destinationView(for item: NavigationItem) -> some View {
        switch item.menu {
        case .compass:
            CompassView()
        case .card:
            CardReflectionView()
        case .radial:
            RadialLayoutView()
        case .actionbutton:
            ActionButtonView()
        case .gooey:
            Text(item.title)
        case .charts:
            DetailView()
        case .halfsheet:
            NavigationStackView()
        }
    }
}

#Preview {
    MainNavigationView()
        .environmentObject(LocationManager())
}
