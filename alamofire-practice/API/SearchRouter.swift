//
//  SearchRouter.swift
//  alamofire-practice
//
//  Created by SIU on 2020/12/31.
//

import Foundation
import Alamofire

// 검색관련 api
enum SearchRouter: URLRequestConvertible {
    
    case searchPhotos(term: String)
    case searchUsers(term: String)
    
    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
        
//        return .get
        
        switch self {
        case .searchPhotos, .searchUsers :
            return .get
        }
        
//        switch self {
//        case .searchPhotos:
//            return .get
//        case .searchUsers:
//             return .post
//        }
    }
    
    var endPoint: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    var parameters : [String: String] {
        
        switch self {
        case let .searchPhotos(term), let .searchUsers(term):
            return ["query" : term]
        }
        
//        switch self {
//        case let .searchPhotos(term) :
//            return ["query1" : term + ""]
//        case let .searchUsers(term) :
//            return ["query2" : term]
//        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("SearchRouter - asURLRequest() called url : \(url)")
        
        var request = URLRequest(url: url)
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
//        switch self {
//        case let .get(parameters):
//            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
//        case let .post(parameters):
//            request = try JSONParameterEncoder().encode(parameters, into: request)
//        }
        
        return request
    }
}

