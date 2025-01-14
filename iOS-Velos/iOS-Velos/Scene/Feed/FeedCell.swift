//
//  FeedCell.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct FeedCell: View {
    private let feedData: Feed

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)

            VStack {
                HStack {
                    ProfileView(profileUrl: URL(string: feedData.profileUrl))
                    Text(feedData.userName)
                        .fontWeight(.bold)
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Spacer()
                    Button {
                        print("더 보기")
                    } label: {
                        Image(systemName: "ellipsis")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                    }
                }
                .padding(EdgeInsets(top: 16, leading: 10, bottom: 5, trailing: 15))

                FeedImageSlideView(feedData: feedData)
                    .frame(minHeight: 350)

                TrainingSummaryView(feedData: feedData)
                    .padding()

                    VStack {
                        HStack {
                            Text(feedData.description)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundStyle(.black)
                                .padding(EdgeInsets(top: 10, leading: 16, bottom: 5, trailing: 0))
                         Spacer()
                        }

                        HStack {
                            Text(feedData.postingDate)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
                            Spacer()
                        }
                    }

                FeedButtonView(feedData: feedData)
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
