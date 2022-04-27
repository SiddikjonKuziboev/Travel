//
//  Cache.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/21/22.
//

import Foundation

class Cache {
    
    class func saveUserData(data: UserDM?) {
        let encoder = JSONEncoder()
        if let encodeData = try? encoder.encode(data) {
            UserDefaults.standard.set(encodeData, forKey: Constants.userData)
        }
    }
    
    class func getUserData()-> UserDM? {
        if let data = UserDefaults.standard.data(forKey: Constants.userData) {
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode(UserDM.self, from: data) {
                return decodeData
            }
        }
    return nil
    }
}
