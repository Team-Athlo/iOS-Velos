//
//  TrainingSummaryView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/14/25.
//

import SwiftUI

struct TrainingSummaryView: View {

    private let feedData: Feed

    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                VStack {
                    Text("거리")
                        .font(.caption)
                    Text("\(feedData.totalDistance)km")
                        .fontWeight(.bold)
                        .font(.headline)
                }
            }

            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                VStack {
                    Text("평균 속도")
                        .font(.caption)
                    Text("\(feedData.averageSpeed)km/h")
                        .fontWeight(.bold)
                        .font(.headline)
                }
            }

            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                VStack {
                    Text("거리")
                        .font(.caption)
                    Text("\(feedData.totalMovingTime)")
                        .fontWeight(.bold)
                        .font(.headline)
                }
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
