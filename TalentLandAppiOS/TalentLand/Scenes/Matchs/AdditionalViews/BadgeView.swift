//
//  BadgeView.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

extension MatchsView {
    @ViewBuilder
    func BadgeView(match: Match) -> some View  {
        if let liveResult = match.liveMinute {
            HStack(alignment: .center) {
                Text(String(liveResult) + " \'")
                    .font(.app(10))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .frame(minWidth: 30)
            }
            .background(Color.liveMinute)
            .clipShape(Capsule())
            .padding(.top, 8)
            .padding(.trailing, 8)
        }
    }
}
