//
//  FeedButtonView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct FeedButtonView: View {
    private let feedData: Feed

    var body: some View {
        HStack {
            Button {
                print("like")
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("\(feedData.numberOflike)")
                        .fontWeight(.semibold)
                        .font(.footnote)
                }
            }

            Spacer()

            Button {
                print("comment")
            } label: {
                HStack {
                    Image(systemName: "bubble.right.fill")
                    Text("\(feedData.numberOfComment)")
                        .fontWeight(.semibold)
                        .font(.footnote)
                }
            }
        }
        .padding(70)
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
