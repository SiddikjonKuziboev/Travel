//
//  API.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/27/22.
//

import Foundation
import Alamofire

class API {
    
    
    enum Endpoint : String {
        case location = "locations"
        case itenaries = "itenaries-"
        case images = "images"
    }
    
     static let baseURLLocation = "https://travl-api.herokuapp.com/"

    
    class func getHeader()-> HTTPHeaders {
        return  [
            "X-RapidAPI-Host": "priceline-com.p.rapidapi.com",
            "X-RapidAPI-Key": "f63d43fa4fmsh2968f0c7d08266cp1926e9jsn8fce67efd3e4"
        ]
    }
    
    class func getPlaces() {
       
        Net.req(url: API.baseURLLocation + Endpoint.location.rawValue, method: .get, param: nil, header: nil, isQuery: false) { d in
            guard let data = d else {return}
            print(data)
        }
        
    }

}
