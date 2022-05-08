//
//  LocationDM.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/27/22.
//

import Foundation
import RealmSwift

class LocationDM: Object, Codable {
    @objc dynamic var itenary: String?
    @objc dynamic var desc: String?
    @objc dynamic var moreWithWeb : String?
    var coordinate: CoordinateDM?
    @objc dynamic var image: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var price: Double = 0.0
    @objc dynamic var slogan: String?
    @objc dynamic var isLike: Bool = false
    @objc dynamic var days: Int = Int.random(in: 1...10)
    
    override class func primaryKey() -> String? {
        "id"
    }
}

class CoordinateDM: Object, Codable {
    @objc dynamic var lon: Double = 0.0
    @objc dynamic var lat: Double = 0.0
}

extension LocationDM {
  static func getLocations() -> [LocationIteamDM] {
    guard
      let url = Bundle.main.url(forResource: "Locations", withExtension: "json"),
      let data = try? Data(contentsOf: url)
        
      else {
        return []
    }
    
    do {
      let decoder = JSONDecoder()
        return try decoder.decode([LocationIteamDM].self, from: data)
    } catch {
      return []
    }
  }
}


struct LocationIteamDM: Codable {
    var itenary: String?
    var desc: String?
    var moreWithWeb : String?
    var coordinate: CoordinateDM?
     var image: String?
     var id: Int = 0
    var price: Double = 0.0
     var slogan: String?
}
