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
}

struct FeedView: View {
    private let feedData: [Feed] = [
        .init(
            userId: "jeon",
            profileUrl: "https://github.com/user-attachments/assets/9688febc-253a-4d9e-aef2-289b8ed7e43c",
            userName: "자린이 엘렌",
            images: [
                "https://github.com/user-attachments/assets/e4484247-b9e9-4f8b-a3ee-eba47aee3ccf",
                "https://github.com/user-attachments/assets/60178cf8-7dd7-4633-a0dc-cb46a6956422"

            ],
            totalDistance: 104,
            averageSpeed: 24,
            totalMovingTime: "3:40:32",
            description: "옷걸이 코스 재미있었다. 그런데 너무 힘들었다 다음엔 어떻게 해야지 매우 긴 텍스트으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으ㅇ옷걸이 코스 재미있었다. 그런데 너무 힘들었다 다음엔 어떻게 해야지 매우 긴 텍스트으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으ㅇ옷걸이 코스 재미있었다. 그런데 너무 힘들었다 다음엔 어떻게 해야지 매우 긴 텍스트으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으으ㅇ",
            numberOflike: 2,
            numberOfComment: 4
        ),
        .init(
            userId: "jeon",
            profileUrl: "https://github.com/user-attachments/assets/9688febc-253a-4d9e-aef2-289b8ed7e43c",
            userName: "자린이 엘렌",
            images: [
"https://github.com/user-attachments/assets/9764ac33-ff74-434f-94d4-8c11c082661a"
            ],
            totalDistance: 34,
            averageSpeed: 24,
            totalMovingTime: "1:40:22",
            description: "오늘은 죠니님과 데이트!!!",
            numberOflike: 199,
            numberOfComment: 0
        ),
        .init(
            userId: "mal",
            profileUrl: "https://github.com/user-attachments/assets/7b6fadea-beae-4624-ae52-b388d9ea4ea7",
            userName: "말선 라이더",
            images: [
"https://github.com/user-attachments/assets/252f91ee-ed96-497f-8531-e5413393d125"
            ],
            totalDistance: 34,
            averageSpeed: 24,
            totalMovingTime: "1:40:22",
            description: "여자친구랑 데이트 즐거웠다",
            numberOflike: 1,
            numberOfComment: 999
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
