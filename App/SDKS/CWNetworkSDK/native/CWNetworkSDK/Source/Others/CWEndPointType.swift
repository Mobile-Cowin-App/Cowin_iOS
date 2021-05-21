//
//  CWQEndPointType.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

protocol CWEndPointType {
    var baseURL: String {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
}
