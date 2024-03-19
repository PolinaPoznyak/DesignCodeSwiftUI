//
//  ChartView.swift
//  DesignCode
//
//  Created by Polina Poznyak on 11.03.24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(chartData) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2023"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("Year", "2023"))
                    .symbol(by: .value("Year", "2023"))
            }
            ForEach(chartData2) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2024"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("Year", "2024"))
                    .symbol(by: .value("Year", "2024"))
            }
        }
        .frame(height: 300)
        .padding(20)
    }
}

#Preview {
    ChartView()
}
