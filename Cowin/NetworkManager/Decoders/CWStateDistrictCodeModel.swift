//
//  CWStateCodeModel.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation
// MARK: - CWStateCodeModel
public struct CWStateCodeModel: Codable {
    public let states: [State]
    public let ttl: Int

    public init(states: [State], ttl: Int) {
        self.states = states
        self.ttl = ttl
    }
}

// MARK: - State
public struct State: Codable {
    public let stateID: Int
    public let stateName: String

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
    }

    public init(stateID: Int, stateName: String) {
        self.stateID = stateID
        self.stateName = stateName
    }
}

// MARK: - CWDistrictCodeModel
public struct CWDistrictCodeModel: Codable {
    public let districts: [District]
    public let ttl: Int

    public init(districts: [District], ttl: Int) {
        self.districts = districts
        self.ttl = ttl
    }
}

// MARK: - District
public struct District: Codable {
    public let districtID: Int
    public let districtName: String

    enum CodingKeys: String, CodingKey {
        case districtID = "district_id"
        case districtName = "district_name"
    }

    public init(districtID: Int, districtName: String) {
        self.districtID = districtID
        self.districtName = districtName
    }
}
