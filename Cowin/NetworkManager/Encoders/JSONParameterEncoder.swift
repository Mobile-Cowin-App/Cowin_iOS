//
//  JSONParameterEncoder.swift
//  CliQAPIKit
//
//  Created by Aravindhan Natarajan on 04/05/21.
//

import Foundation
import Photos

public struct JSONParameterEncoder: ParameterEncoder {
    
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
        
    }
    


}

public struct AttachmentParameterEncoder {
    static func encode(assetsArray: [PHAsset], urlRequest: inout URLRequest) throws {
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = NSMutableData()
        
        assetsArray.forEach { eachImageAsset in
            let imageData = CWNetworkUtilities.getAssetThumbnail(asset: eachImageAsset, size: 1).pngData()
            
            httpBody.append(CWNetworkUtilities.convertFileData(fieldName: "attachment",
                                                                fileName: eachImageAsset.originalFilename ?? "",
                                                                mimeType: "image/png",
                                                                fileData: imageData!,
                                                                using: boundary))
            
        }
        
        
        httpBody.appendString("--\(boundary)--")
        
        urlRequest.httpBody = httpBody as Data
        
        
    }
}
