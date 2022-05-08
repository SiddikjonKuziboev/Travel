//
//  MyRealmData.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/27/22.
//

import Foundation
import RealmSwift

class MyRealmData {
    
    static let shared = MyRealmData()
    var realm: Realm!
    
    init() {
        realm = try! Realm()
        print(realm.configuration.fileURL,"fileurl")
    }
    
    func saveLocations(data: LocationDM) {
        try! realm.write {
            realm.add(data, update: .modified)
        }
    }
    
    func fetchData()-> [LocationDM] {
        realm.objects(LocationDM.self).compactMap{$0}
        }
    
    func removeLocations() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func setLike(id: Int) {
        let d = realm.objects(LocationDM.self).compactMap{$0}
        
        for i in d where i.id == id {
            try! realm.write({
                i.isLike = !i.isLike
            })
        }
        
    }
}

