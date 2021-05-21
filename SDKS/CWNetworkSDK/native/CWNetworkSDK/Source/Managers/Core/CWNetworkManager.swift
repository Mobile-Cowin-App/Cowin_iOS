//
//  CWNetworkManager.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation
public enum CWNetworkEnvironment {
    case production
    case development
    case testing
    case inhouse
}

public struct CWNetworkManager {
    
    public static var environment: CWNetworkEnvironment = .production
    
    public static let requester = CWNetworkManager()
    
    public init() {}
    
    internal let authrouter = {
        return CWRouter<CWAuthRouter>()
    }()
    
    internal let statsrouter = {
        return CWRouter<CWStatsRouter>()
    }()
    
    internal let uniqueidrouter = {
        return CWRouter<CWUniqueIDRouter>()
    }()
    
    internal let membersrouter = {
        return CWRouter<CWMembersRouter>()
    }()
}
