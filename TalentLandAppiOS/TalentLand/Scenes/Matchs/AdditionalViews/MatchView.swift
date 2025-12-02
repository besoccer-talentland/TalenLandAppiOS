//
//  MatchView.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

extension MatchsView {
    @ViewBuilder
    func TeamView(
        match: Match,
        isLocal: Bool
    ) -> some View  {
        HStack(spacing: 15) {
            if isLocal {
                if let localName = match.localName {
                    Text(localName)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .font(.app())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                if let localShield = match.localShield {
                    AsyncImageView(url: localShield, isCircular: true)
                        .frame(width: 25, height: 25)
                }
            } else {
                if let visitorShield = match.visitorShield {
                    AsyncImageView(url: visitorShield, isCircular: true)
                        .frame(width: 25, height: 25)
                }
                if let visitorName = match.visitorName {
                    Text(visitorName)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .font(.app())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: isLocal ? .trailing : .leading)
    }

    @ViewBuilder
    func MatchView(
        match: Match,
        isFirst: Bool,
        isLast: Bool,
    ) -> some View  {
        HStack(alignment: .center, spacing: 25) {
            TeamView(match: match, isLocal: true)
            if let score = match.score {
                Text(score)
                    .font(.app(19))
                    .frame(width: 40, alignment: .center)
            }
            TeamView(match: match, isLocal: false)
        }
        .frame(height: 75)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    Color(.rowBackground1),
                    Color(.rowBackground2),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(
            RoundedCornerShape(
                radius: isFirst || isLast ? 10 : 0,
                corners: isFirst
                    ? [.topLeft, .topRight]
                    : isLast ? [.bottomLeft, .bottomRight] : [],
            ),
        )
    }
}
