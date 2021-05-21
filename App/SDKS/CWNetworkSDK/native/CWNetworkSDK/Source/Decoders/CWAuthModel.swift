//
//  CWOTPRequestModel.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation
// MARK: - CWOTPRequestModel
public struct CWOTPRequestModel: Codable {
    public let txnID: String

    enum CodingKeys: String, CodingKey {
        case txnID = "txnId"
    }

    public init(txnID: String) {
        self.txnID = txnID
    }
}

// MARK: - CWOTPValidateModel
public struct CWOTPValidateModel: Codable {
    public let token, isNewAccount: String

    public init(token: String, isNewAccount: String) {
        self.token = token
        self.isNewAccount = isNewAccount
    }
}
