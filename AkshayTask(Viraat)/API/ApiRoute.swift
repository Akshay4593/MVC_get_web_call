//
//  ApiRoute.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 23/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class Constant {
    private init() {}
    
    static let HEADLINES_BASE_PATH = "http://newsapi.org"
}


enum APIRoute {
    
    case headLine
    
}

extension APIRoute {
    
    private var baseUrl: String {
        return Constant.HEADLINES_BASE_PATH
    }
    
    private var apiEndPoint: String {
        return  "\(baseUrl)\(version)\(category)"
    }
    
    private var version: String {
        switch self {
        case .headLine:
            return "/v2"
        }
    }
    
    private var category: String {
        switch self {
        case .headLine:
            return "/top-headlines"
        }
    }
    
    var url: URL {
        return URL(string: apiEndPoint)!
    }
    
    var asRoute: Route {
        return Route.getRoute(path: apiEndPoint)
    }
}

