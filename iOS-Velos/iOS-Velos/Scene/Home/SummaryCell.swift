//
//  SummaryCell.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct SummaryCell: View {
    private let title: String
    private let description: String

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)

            VStack {
                Text(title)
                    .foregroundStyle(.black)
                Spacer()
                    .frame(height: 10)
                Text(description)
                    .foregroundStyle(.black)
                    .font(.title)
                    .fontWeight(.heavy)
            }
        }
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
