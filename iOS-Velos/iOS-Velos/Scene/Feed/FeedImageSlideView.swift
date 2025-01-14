//
//  FeedImageSlideView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct FeedImageSlideView: View {

    private let feedData: Feed
    @State private var currentIndex: Int = 0

    var body: some View {
        ZStack {
                TabView(
                    selection: $currentIndex,
                    content:  {
                        ForEach(feedData.images.indices, id: \.self) { indexPath in
                            AsyncImage(url: URL(string: feedData.images[indexPath])) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .tag(indexPath)
                                } else if phase.error != nil {
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .overlay(Text("Failed to load").foregroundColor(.white))
                                } else {
                                    ZStack {
                                        Rectangle()
                                        ProgressView()
                                    }
                                }
                            }
                        }
                    }
                )
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            if feedData.images.count != 1 {
                VStack {
                    HStack {
                        Spacer()

                        Text("\(currentIndex + 1)/\(feedData.images.count)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(8)
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                    Spacer()
                }
            }
        }
    }

    init(feedData: Feed) {
        self.feedData = feedData
    }
}
