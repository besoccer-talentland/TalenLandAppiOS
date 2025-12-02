//
//  ErrorNetwork.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

import Foundation

enum ErrorNetwork: Error {
    case decodingError(Error)
    case invalidURL
    case serverError(Int, Data?)
    case unknown(Error)
}
