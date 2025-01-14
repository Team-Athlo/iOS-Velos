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
                .padding(EdgeInsets(top: 15, leading: 10, bottom: 5, trailing: 15))

                FeedImageSlideView(feedData: feedData)
                    .frame(minHeight: 350)

                TrainingSummaryView(feedData: feedData)
                    .padding()

                HStack {
                    Text(feedData.description)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding()
                    
                    Spacer()
                }

                FeedButtonView(feedData: feedData)
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
