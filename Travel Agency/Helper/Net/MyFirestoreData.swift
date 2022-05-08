//
//  MyFirestoreData.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/30/22.
//

import Foundation
import Firebase

class MyFirestoreData {

    static let shared = MyFirestoreData()
    let firestoreData = Firestore.firestore()


    func setOrderToFirestore(data: OrdersDM?) {
        if let userDefData = Cache.getUserData(), let data = data {
            firestoreData.collection("orders").document(userDefData.phoneNumber.replacingOccurrences(of: " ", with: "")).setData([
                "people" : data.people,
                "customer" : data.customer,
                "place" : data.place,
                "price" : data.price,
                "days" : data.days,
                "placeId": data.placeId
            ])
            Alert.showAlert(state: .success, message: "Succesfully")

            
        }else {
            Alert.showAlert(state: .warning, message: "Something is wrong")
        }
    }

     func getMyOrderId(completion: @escaping (Int?)-> Void) {
        if let userDefData = Cache.getUserData() {
           firestoreData.collection("orders").getDocuments { querySnapshot, error in
               if error != nil {
                    completion(nil)
                }else {
                    for i in querySnapshot!.documents where i.documentID == userDefData.phoneNumber {
                        let id = i.data()["placeId"] as! Int
                        completion(id)
                    }
                }
            }
        }
    }
    
    
}
