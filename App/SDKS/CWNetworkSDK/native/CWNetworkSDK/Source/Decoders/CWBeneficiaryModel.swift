//
//  CWBeneficiaryCodeModel.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

// MARK: - CWBeneficiaryModel
public struct CWBeneficiaryModel: Codable {
    public let types: [TypeElement]
    public let ttl: Int

    public init(types: [TypeElement], ttl: Int) {
        self.types = types
        self.ttl = ttl
    }
}

// MARK: - TypeElement
public struct TypeElement: Codable {
    public let type: String
    public let id: Int
    public let docType: String?
    public let flag: Int

    enum CodingKeys: String, CodingKey {
        case type, id
        case docType = "doc_type"
        case flag
    }

    public init(type: String, id: Int, docType: String?, flag: Int) {
        self.type = type
        self.id = id
        self.docType = docType
        self.flag = flag
    }
}


// MARK: - CWBeneficiaryListModel
public struct CWBeneficiaryListModel: Codable {
    public let beneficiaries: [BeneficiaryDetail]

    public init(beneficiaries: [BeneficiaryDetail]) {
        self.beneficiaries = beneficiaries
    }
}

// MARK: - Beneficiary
public struct BeneficiaryDetail: Codable {
    public let beneficiaryReferenceID, name, birthYear, gender: String
    public let mobileNumber, photoIDType, photoIDNumber, comorbidityInd: String
    public let vaccinationStatus, vaccine, dose1Date, dose2Date: String

    enum CodingKeys: String, CodingKey {
        case beneficiaryReferenceID = "beneficiary_reference_id"
        case name
        case birthYear = "birth_year"
        case gender
        case mobileNumber = "mobile_number"
        case photoIDType = "photo_id_type"
        case photoIDNumber = "photo_id_number"
        case comorbidityInd = "comorbidity_ind"
        case vaccinationStatus = "vaccination_status"
        case vaccine
        case dose1Date = "dose1_date"
        case dose2Date = "dose2_date"
    }

    public init(beneficiaryReferenceID: String, name: String, birthYear: String, gender: String, mobileNumber: String, photoIDType: String, photoIDNumber: String, comorbidityInd: String, vaccinationStatus: String, vaccine: String, dose1Date: String, dose2Date: String) {
        self.beneficiaryReferenceID = beneficiaryReferenceID
        self.name = name
        self.birthYear = birthYear
        self.gender = gender
        self.mobileNumber = mobileNumber
        self.photoIDType = photoIDType
        self.photoIDNumber = photoIDNumber
        self.comorbidityInd = comorbidityInd
        self.vaccinationStatus = vaccinationStatus
        self.vaccine = vaccine
        self.dose1Date = dose1Date
        self.dose2Date = dose2Date
    }
}

// MARK: - CWBAddMembertModel
public struct CWBAddMembertModel: Codable {
    public let beneficiaryReferenceID: Int

    enum CodingKeys: String, CodingKey {
        case beneficiaryReferenceID = "beneficiary_reference_id"
    }

    public init(beneficiaryReferenceID: Int) {
        self.beneficiaryReferenceID = beneficiaryReferenceID
    }
}
