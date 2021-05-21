//
//  CWNetworkRouter.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.
//

import Foundation

public typealias Parameters = [String:Any]
public typealias HTTPHeaders = [String:String]
public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

public enum NetworkError: String , Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding Failed."
    case missingURL = "URL is nil."
}

public enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first"
    case badRequest = "Bad Request"
    case outdated = "The url you requester is outdated"
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "We could not decode the response"
}

internal protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

internal protocol NetworkRouter {
    associatedtype EndPoint: CWEndPointType
    func request(_ route: EndPoint , completion handler: @escaping NetworkRouterCompletion)
    func cancel()
}

class CWRouter<EndPoint: CWEndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion handler: @escaping NetworkRouterCompletion) {
        let session = URLSession(configuration: .default)
        do {
            let request = try self.buildRequest(from: route)
            Log.i(request.url?.absoluteString ?? "Request triggered with empty URL")
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                handler(data , response , error)
            })
            task?.resume()
        } catch {
            handler(nil , nil , error)
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        guard let endpoint = URL(string: "\(route.baseURL)\(route.path)") else { return URLRequest.init(url: URL.init(string: "")!)}
        
        var request = URLRequest(url: endpoint)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            case .requestParameters(bodyParameters: let bodyParameters, urlParameters: let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
                
            case .requestParametersAndHeaders(bodyParameters: let bodyParameters, urlParameters: let urlParameters, additionalHeaders: let headers):
                self.addAdditionalHeaders(headers, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
                
            case .requestParametersHeaderWithImageAttachment(bodyParameters: let bodyData):
                try AttachmentParameterEncoder.encode(assetsArray: bodyData, urlRequest: &request)
            }
            
        } catch {
            throw error
        }
        
        return request
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters? , urlParameters: Parameters? , request: inout URLRequest) throws {
        do {
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
            
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders? , request: inout URLRequest) {
        guard let headers = additionalHeaders else {return}
        for (key , value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
    }
}
