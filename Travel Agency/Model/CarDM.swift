//
//  CarDM.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 5/8/22.
//

import Foundation

class CarDM: Codable {
    var  engineSize: Double
    var fuelType: String
    var carColor: String
    var transmission: String
    var conditioner: Bool
    var insurance: Double
    var image: String
    var id: Int
    var price: Double
    var name: String
    var year: Int
   
    init(engineSize: Double, fuelType: String, carColor: String, transmission: String, conditioner: Bool, insurance: Double, image: String, id: Int, price: Double, name:String, year: Int) {
        self.engineSize = engineSize
        self.fuelType = fuelType
        self.carColor = carColor
        self.transmission = transmission
        self.conditioner = conditioner
        self.insurance = insurance
        self.image = image
        self.id = id
        self.price = price
        self.name = name
        self.year = year
    }
}

extension CarDM {
    static func getCars()-> [CarDM] {
        guard let url = Bundle.main.url(forResource: "Cars", withExtension: "json"), let data = try? Data(contentsOf: url) else {return []}
        
        do {
            return try JSONDecoder().decode([CarDM].self, from: data)
        }catch {
            return []
        }
        
    }
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
