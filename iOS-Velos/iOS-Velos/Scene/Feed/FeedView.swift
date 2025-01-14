//
//  FeedView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct Feed {
    let id = UUID()
    let userId: String
    let profileUrl: String
    let userName: String
    let images: [String]
    let totalDistance: Int
    let averageSpeed: Int
    let totalMovingTime: String
    let description: String
    let numberOflike: Int
    let numberOfComment: Int
    let postingDate: String
}

struct FeedView: View {
    private let feedData: [Feed] = [
        .init(
            userId: "jeon",
            profileUrl: "https://github.com/user-attachments/assets/9688febc-253a-4d9e-aef2-289b8ed7e43c",
            userName: "자린이 엘렌",
            images: [
                "https://github.com/user-attachments/assets/a2186f7a-12bb-4174-9c94-6cc0146839d5",
                "https://github.com/user-attachments/assets/7c2398d2-3fa4-472a-b65e-f55d2acde846"
            ],
            totalDistance: 104,
            averageSpeed: 24,
            totalMovingTime: "3:40:32",
            description: "남산 코스 너무 힘들었다 하지만 재미있었지.....\n다음에 리벤지 해야겠다.\n가능?",
            numberOflike: 2,
            numberOfComment: 4,
            postingDate: "1시간 전"
        ),
        .init(
            userId: "jeon",
            profileUrl: "https://github.com/user-attachments/assets/9688febc-253a-4d9e-aef2-289b8ed7e43c",
            userName: "자린이 엘렌",
            images: [
                "https://github.com/user-attachments/assets/252f91ee-ed96-497f-8531-e5413393d125"
            ],
            totalDistance: 34,
            averageSpeed: 26,
            totalMovingTime: "1:40:22",
            description: "오늘은 죠니님과 데이트!!!",
            numberOflike: 199,
            numberOfComment: 0,
            postingDate: "2024년 11월 1일"
        ),
        .init(
            userId: "mal",
            profileUrl: "https://github.com/user-attachments/assets/7b6fadea-beae-4624-ae52-b388d9ea4ea7",
            userName: "말선 라이더",
            images: [
                "https://github.com/user-attachments/assets/60178cf8-7dd7-4633-a0dc-cb46a6956422",
                "https://github.com/user-attachments/assets/7d4441ee-6d18-4a91-aac1-874c148032d8"
            ],
            totalDistance: 86,
            averageSpeed: 34,
            totalMovingTime: "1:40:22",
            description: "여자친구랑 데이트 즐거웠다",
            numberOflike: 1,
            numberOfComment: 999,
            postingDate: "2024년 10월 27일"

        )
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 20, content: {
                ForEach(feedData, id: \.id) { data in
                    FeedCell(feedData: data)
                }
            })
        }
        .scrollIndicators(.hidden)
        .padding(16)
    }
}
