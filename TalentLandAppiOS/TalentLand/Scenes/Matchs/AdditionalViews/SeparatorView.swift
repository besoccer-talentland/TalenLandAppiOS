//
//  SeparatorView.swift
//  TalentLand
//
//  Created by BeSoccer on 2/12/25.
//

import SwiftUI

extension MatchsView {
    @ViewBuilder
    func SeparatorView(isLast: Bool) -> some View  {
        if !isLast {
            Rectangle()
                .fill(Color(.white))
                .frame(height: 2)
                .frame(maxWidth: .infinity)
        }
    }
}
