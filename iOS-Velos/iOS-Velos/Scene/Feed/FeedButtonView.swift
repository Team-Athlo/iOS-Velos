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
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)

                    HStack {
                        Image(systemName: "heart.fill")
                        Text("\(feedData.numberOflike)")
                            .fontWeight(.semibold)
                            .font(.footnote)
                    }
                }
            }

            Button {
                print("comment")
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    HStack {
                        Image(systemName: "bubble.right.fill")
                        Text("\(feedData.numberOfComment)")
                            .fontWeight(.semibold)
                            .font(.footnote)
                    }
                }
            }
        }
        .padding()
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
