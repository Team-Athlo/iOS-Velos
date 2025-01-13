//
//  HomeView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct WeeklyTraining {
    let dayOfWeek: String
    let hadTraining: Bool
}

struct Summary {
    let id = UUID()
    let title: String
    let description: String
}

struct HomeView: View {

    private let viewModel: HomeViewModel
    private let weeklyTraining: [WeeklyTraining] = [
        .init(dayOfWeek: "월", hadTraining: true),
        .init(dayOfWeek: "화", hadTraining: false),
        .init(dayOfWeek: "수", hadTraining: true),
        .init(dayOfWeek: "목", hadTraining: false),
        .init(dayOfWeek: "금", hadTraining: false),
        .init(dayOfWeek: "토", hadTraining: true),
        .init(dayOfWeek: "일", hadTraining: false),
    ]

    private let cellData: [Summary] = [
        .init(title: "주간 훈련량", description: "234"),
        .init(title: "FTP", description: "147W"),
        .init(title: "최대 심박수", description: "189"),
        .init(title: "뭐넣지", description: "몰루"),
    ]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ZStack {
                        WeeklyCellView(weeklyTrainigData: weeklyTraining)
                    }
                }
                .padding(16)

                ZStack {
                    Rectangle()
                        .frame(height: 90)
                        .foregroundStyle(.white)
                    Text("광고자리")
                }

                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: 10,
                    content: {
                        ForEach(cellData, id: \.id) { data in
                            GeometryReader { geometry in
                                SummaryCell(title: data.title, description: data.description)
                                    .frame(width: geometry.size.width, height: geometry.size.width)
                            }
                            .aspectRatio(1, contentMode: .fit)
                        }
                    })
                .padding(16)
            }
        }
        .scrollIndicators(.hidden)
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

