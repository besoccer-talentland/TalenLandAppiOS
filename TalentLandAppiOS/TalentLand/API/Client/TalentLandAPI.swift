//
//  TalentLandAPI.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

// MARK: - TalentLandAPI

/// The BetsAPI protocol defines the interface for accessing services.
/// It provides a method to retrieve an instance of a service conforming to the `TalentLandAPI` protocol.
/// More services can be added in the future as needed.

public protocol TalentLandAPI: AnyObject {
    func matchs() -> any MatchsRepository
}
