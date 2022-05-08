//
//  Net.swift
//  
//
//  Created by Kuziboev Siddikjon on 4/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class Net {
    
    class func req(url: String, method: HTTPMethod, param: [String : Any]?, header: HTTPHeaders?, withLoader: Bool = false, isQuery: Bool = false, completion: @escaping (JSON?) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            
            if withLoader {
                Loader.start()
            }
            AF.request(url, method: method, parameters: param, encoding:  isQuery ? URLEncoding(destination: .queryString) : JSONEncoding.default, headers: header).response { response in
                print(JSON(response.data),"Net")

                Loader.stop()
                if let data = response.data {
                    completion(JSON(data))
                }else {
                    completion(nil)
                }
            }
        }else {
            completion(nil)
            Loader.stop()
            Alert.showAlert(state: .error, message: "Check your internet connection")
        }
    }
    

    class func isSuccess(json: JSON)-> Bool {
        if json["statusCode"].intValue == 200 {
            return true
        }else {
            return false
        }
    }


    
    class func reqMultiFormData(url: String, image: UIImage, method: HTTPMethod, header: HTTPHeaders?, completion: @escaping (JSON?) -> (Void)) {
        
        if Reachability.isConnectedToNetwork() {
            
            if let imgData = image.jpegData(compressionQuality: 0.4) {

                AF.upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(imgData, withName: "file", fileName: "\(Date().timeIntervalSince1970).png",
                    mimeType: "image/png")
                    multipartFormData.append("img".data(using: .utf8)!, withName: "type")
                    
                    
                }, to: url, method: method, headers: header).responseJSON { response in
                    print(response,"response image")

                    switch response.result {
                    case .success:
                    completion(JSON(response.data!))
                    case let .failure(error):
                        print(error.localizedDescription)
                        Alert.showAlert(state: .error, message: "Unknown error occured")
                    }
                }
                
            }
            
        }else {
            //Not connected
            Alert.showAlert(state: .warning, message: "Check your internet connection")

            completion(nil)

        }
    }
    
    
    class func reqMultiFormDataForFile(url: String, data: Data, method: HTTPMethod, header: HTTPHeaders, withLoader: Bool = false, completion: @escaping (_ data: JSON?) -> ()) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {
                Loader.start()
            }
                AF.upload(multipartFormData: { multipartFormData in
                    
                    multipartFormData.append(data, withName: "file", fileName: "file.doc", mimeType: "document/doc")

                }, to: url, method: method, headers: header).responseJSON { response in
                    Loader.stop()

                    print(response,"response file")

                    switch response.result {
                        
                    case .success:
                    completion(JSON(response.data!))
                        
                    case let .failure(error):
                        print(error.localizedDescription)
                        Alert.showAlert(state: .error, message: "Unknown error occured")
                    }
                }
            
        }else {
            //Not connected
            Alert.showAlert(state: .warning, message: "Check your internet connection")
            Loader.stop()

            completion(nil)

        }
    }
    
}
