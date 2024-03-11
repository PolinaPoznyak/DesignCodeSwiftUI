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
            List(0 ..< 5) { item in
                NavigationLink(destination: Text("Content")) {
                    Label("Label", systemImage: "house")
                        .foregroundColor(.primary)
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
