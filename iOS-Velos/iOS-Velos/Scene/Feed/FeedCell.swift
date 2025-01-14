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
                Spacer(minLength: 16)

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
                    }
                }
                .padding(10)

                FeedImageSlideView(feedData: feedData)

                Spacer(minLength: 16)

                Text(feedData.description)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .foregroundStyle(.black)
                    .padding()

                Spacer(minLength: 24)

                FeedButtonView(feedData: feedData)

                Spacer(minLength: 16)
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
