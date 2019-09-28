//
//  Request.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 23/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

enum Params : String {
    
    case country = "us"
    case apiKey = "2352d41b50804fcebefbbe2fde7d8b13"
    
    var value : String {
        return self.rawValue
    }
    
}

class Request: APIRequest<ResponseModel> {
    
    var country: String = ""
    var apiKey: String = ""
    
    init(country: String, apiKey: String) {
        self.country = country
        self.apiKey = apiKey
        super.init(route: APIRoute.headLine.asRoute)
  
    }
    
    override func getParameters() -> [String : Any] {
        return ["Country":country, "apiKey" : apiKey]
    }
    
}
