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
                Spacer()
                    .frame(height: 16)

                HStack {
                    ProfileView(profileUrl: URL(string: feedData.profileUrl))
                    Text(feedData.userName)
                        .fontWeight(.bold)
                        .font(.subheadline)
                    Spacer()
                    Button {
                        print("더 보기")
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding(10)

                FeedImageSlideView(feedData: feedData)

                Text(feedData.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)

                Spacer()
                    .frame(height: 24)

                FeedButtonView(feedData: feedData)

                Spacer()
                    .frame(height: 16)
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
