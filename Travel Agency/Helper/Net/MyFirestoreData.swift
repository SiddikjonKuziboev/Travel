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
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            let dateString = formatter.string(from: Date())
            
            firestoreData.collection("orders").document(userDefData.phoneNumber.replacingOccurrences(of: " ", with: "")).setData([
                "people" : data.people,
                "customer" : data.customer,
                "place" : data.place,
                "price" : data.price,
                "days" : data.days,
                "placeId": data.placeId,
                "date" : dateString
            ])
            Alert.showAlert(state: .success, message: "Succesfully")

            
        }else {
            Alert.showAlert(state: .warning, message: "Something is wrong")
        }
    }

    func getMyOrders(completion: @escaping ([OrdersDM]?)-> Void) {
          firestoreData.collection("orders").getDocuments { querySnapshot, error in
              if error != nil {
                   completion(nil)
               }else {
                   if let doc = querySnapshot?.documents {
                       var orders: [OrdersDM] = []
                       for i in doc {
                           orders.append(OrdersDM(
                            placeId: i.data()["placeId"] as! Int,
                            customer: i.data()["customer"] as! String,
                            days: i.data()["days"] as! Int,
                            people: i.data()["people"] as! Int,
                            place: i.data()["place"] as! String,
                            price: i.data()["price"] as! Double,
                            date: i.data()["date"] as! String)
                           )
                           
                       }
                       completion(orders)
                   }else {
                       completion(nil)
                   }
               }
           }
   }
//    var placeId: Int
//    var customer: String
//    var days: Int
//    var people: Int
//    var place: String
//    var price: Double
//    var date: Date
    
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
