//
//  AnyEncodable.swift
//  TalentLandAppiOS
//
//  Created by BeSoccer on 2/12/25.
//

struct AnyEncodable: Encodable {
    private let encodeFunc: (Encoder) throws -> Void

    init<T: Encodable>(_ value: T) {
        encodeFunc = value.encode
    }

    func encode(to encoder: Encoder) throws {
        try encodeFunc(encoder)
    }
}
