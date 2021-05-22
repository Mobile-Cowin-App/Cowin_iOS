//
//  CWVaccineCenterSlotList.swift
//  CWNetworkSDK
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation

// MARK: - CWVaccineCenterSlotList
public struct CWVaccineCenterSlotList: Codable {
    public let centers: [Center]

    enum CodingKeys: String, CodingKey {
        case centers = "centers"
    }

    public init(centers: [Center]) {
        self.centers = centers
    }
}

// MARK: - Center
public struct Center: Codable {
    public let centerID: Int
    public let name: String
    public let address: String
    public let stateName: String
    public let districtName: String
    public let blockName: String
    public let pincode: Int
    public let lat: Int
    public let long: Int
    public let from: String
    public let to: String
    public let feeType: String
    public let sessions: [Session]?

    enum CodingKeys: String, CodingKey {
        case centerID = "center_id"
        case name = "name"
        case address = "address"
        case stateName = "state_name"
        case districtName = "district_name"
        case blockName = "block_name"
        case pincode = "pincode"
        case lat = "lat"
        case long = "long"
        case from = "from"
        case to = "to"
        case feeType = "fee_type"
        case sessions = "sessions"
    }

    public init(centerID: Int, name: String, address: String, stateName: String, districtName: String, blockName: String, pincode: Int, lat: Int, long: Int, from: String, to: String, feeType: String, sessions: [Session]?) {
        self.centerID = centerID
        self.name = name
        self.address = address
        self.stateName = stateName
        self.districtName = districtName
        self.blockName = blockName
        self.pincode = pincode
        self.lat = lat
        self.long = long
        self.from = from
        self.to = to
        self.feeType = feeType
        self.sessions = sessions
    }
}

// MARK: - Session
public struct Session: Codable {
    public let sessionID: String
    public let date: String
    public let availableCapacity: Int
    public let minAgeLimit: Int
    public let vaccine: String
    public let slots: [Slot]
    public let availableCapacityDose1: Int
    public let availableCapacityDose2: Int

    enum CodingKeys: String, CodingKey {
        case sessionID = "session_id"
        case date = "date"
        case availableCapacity = "available_capacity"
        case minAgeLimit = "min_age_limit"
        case vaccine = "vaccine"
        case slots = "slots"
        case availableCapacityDose1 = "available_capacity_dose1"
        case availableCapacityDose2 = "available_capacity_dose2"
    }

    public init(sessionID: String, date: String, availableCapacity: Int, minAgeLimit: Int, vaccine: String, slots: [Slot], availableCapacityDose1: Int, availableCapacityDose2: Int) {
        self.sessionID = sessionID
        self.date = date
        self.availableCapacity = availableCapacity
        self.minAgeLimit = minAgeLimit
        self.vaccine = vaccine
        self.slots = slots
        self.availableCapacityDose1 = availableCapacityDose1
        self.availableCapacityDose2 = availableCapacityDose2
    }
}

public enum Slot: String, Codable {
    case the0100Pm0300Pm = "01:00PM-03:00PM"
    case the0300Pm0500Pm = "03:00PM-05:00PM"
    case the0900Am1100Am = "09:00AM-11:00AM"
    case the1100Am0100Pm = "11:00AM-01:00PM"
}

// MARK: - CWCAPTCHAModel
public struct CWCAPTCHAModel: Codable {
    public let captcha: String

    enum CodingKeys: String, CodingKey {
        case captcha = "captcha"
    }

    public init(captcha: String) {
        self.captcha = captcha
    }
}

// MARK: - CWAppointmentModel
public struct CWAppointmentModel: Codable {
    public let appointmentConfirmationNo: String

    enum CodingKeys: String, CodingKey {
        case appointmentConfirmationNo = "appointment_confirmation_no"
    }

    public init(appointmentConfirmationNo: String) {
        self.appointmentConfirmationNo = appointmentConfirmationNo
    }
}
