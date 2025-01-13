//
//  FeedImageSlideView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct FeedImageSlideView: View {

    private let feedData: Feed
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], content: {
                ForEach(feedData.images, id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(1/1, contentMode: .fill)
                                .clipped()
                        } else {
                            Rectangle()
                                .foregroundStyle(.gray)
                                .aspectRatio(1/1, contentMode: .fill)
                        }
                    }
                }
            })
        }
        .scrollDisabled(feedData.images.count == 1 ? true : false)
        .scrollIndicators(.hidden)

    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
