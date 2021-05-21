//
//  CWNetworkUtilities.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation
import Foundation
import Photos
import UIKit
import CommonCrypto

enum Result<String> {
    case success
    case failure(String)
}


struct CWNetworkUtilities {
    
    static func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    
    internal static func getResponseModel<T: Codable>(data: Data? , error: Error? , response: URLResponse? , type: T.Type) -> (model: T? , error: String?) {
        if let httpResponse = response as? HTTPURLResponse {
            
            switch CWNetworkUtilities.handleNetworkResponse(httpResponse) {
            
            case .success:
                guard let safeData = data else {
                    Log.e(httpResponse)
                    return (nil , "Error in Data")
                }
                do {
                    Log.s("Decoded SuccessFull \(String(describing: String(data: safeData , encoding: .utf8)))")
                    return (try JSONDecoder().decode(T.self, from: safeData) , nil)
                }
                catch {
                    Log.e(error)
                    return (nil , error.localizedDescription)
                }
                
                
            case .failure(let errordetails):
                Log.e(errordetails)
                return (nil , errordetails)
                
            }
        }
        
         return (nil , "Error in Response")
    }
    
    
   
    
}

//MARK:- ATTACHMENT HELPER UTILS
internal extension CWNetworkUtilities {
    static func getAssetThumbnail(asset: PHAsset, size: CGFloat) -> UIImage {
        let retinaScale = UIScreen.main.scale
        let retinaSquare = CGSize(width: size * retinaScale, height: size * retinaScale)
        let cropSizeLength = min(asset.pixelWidth, asset.pixelHeight)
        let square = CGRect(x: 0, y: 0, width: CGFloat(cropSizeLength), height: CGFloat(cropSizeLength))
        let cropRect = square.applying(CGAffineTransform(scaleX: 1.0/CGFloat(asset.pixelWidth), y: 1.0/CGFloat(asset.pixelHeight)))
        
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        var thumbnail = UIImage()
        
        options.isSynchronous = true
        options.deliveryMode = .highQualityFormat
        options.resizeMode = .exact
        options.normalizedCropRect = cropRect
        
        manager.requestImage(for: asset, targetSize: retinaSquare, contentMode: .aspectFit, options: options, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    
    static func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
        let data = NSMutableData()
        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition: form-data; name=\"attachment\"; filename=\"\(fileName)\"\r\n")
        data.appendString("Content-Type: \(mimeType)\r\n\r\n")
        data.append(fileData)
        data.appendString("\r\n")
        return data as Data
    }
}

extension NSMutableData {
    internal func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}

extension PHAsset {
    
    internal var originalFilename: String? {
        
        var fname:String?
        
        let resources = PHAssetResource.assetResources(for: self)
        if let resource = resources.first {
            fname = resource.originalFilename
        }
        
        return fname
    }
}

public extension String {

  var sha256: String {
      let data = Data(utf8)
      var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))

      data.withUnsafeBytes { buffer in
          _ = CC_SHA256(buffer.baseAddress, CC_LONG(buffer.count), &hash)
      }

      return hash.map { String(format: "%02hhx", $0) }.joined()
  }
    
    static var makeEmpty: String {
        return ""
    }
}
