//
//  WeeklyCell.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct WeeklyCellView: View {

    private let weeklyTrainigData: [WeeklyTraining]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)

            VStack {
                Spacer()
                    .frame(height: 16)

                Text("주간 누적 거리")

                Spacer()
                    .frame(height: 8)

                Text("172km")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)

                Spacer()
                    .frame(height: 32)

                LazyHGrid(rows: [GridItem(.flexible())], content: {
                    ForEach(weeklyTrainigData, id: \.dayOfWeek) { data in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 40, height: 60)
                                .foregroundColor(data.hadTraining ? Color.gray: Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.gray, lineWidth: 1)
                                )

                            VStack {
                                Text(data.dayOfWeek)
                                    .fontWeight(.heavy)

                                Spacer()
                                    .frame(height: 3)

                                if data.hadTraining {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .frame(height: 20)
                                        .fontWeight(.heavy)
                                } else {
                                    Spacer()
                                        .frame(height: 20)
                                }
                            }
                        }
                    }
                })

                Spacer()
                    .frame(height: 16)
            }
        }
    }

    init(weeklyTrainigData: [WeeklyTraining]) {
        self.weeklyTrainigData = weeklyTrainigData
    }
}
