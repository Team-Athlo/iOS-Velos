//
//  ProfileView.swift
//  iOS-Velos
//
//  Created by Ellen J on 1/13/25.
//

import SwiftUI

struct ProfileView: View {
    private let profileUrl: URL?

    var body: some View {
        HStack {
            AsyncImage(url: profileUrl) { phase in
                if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 52, height: 52)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 52, height: 52)
                        .foregroundStyle(.gray)
                }
            }
        }
    }

    init(profileUrl: URL?) {
        self.profileUrl = profileUrl
    }
}
