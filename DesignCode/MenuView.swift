//
//  MenuView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List(navigationItems) { item in
            Button {
                selectedMenu = item.menu
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                .padding(8)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    MenuView()
}
