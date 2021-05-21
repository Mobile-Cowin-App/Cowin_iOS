//
//  CWHttpTask.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation
import Photos

public enum HTTPTask {
    
    case request
    
    case requestParameters(bodyParameters: Parameters? ,
                           urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters? ,
                                     urlParameters: Parameters? ,
                                     additionalHeaders: HTTPHeaders?)
    
    case requestParametersHeaderWithImageAttachment(bodyParameters: [PHAsset])
    
}
