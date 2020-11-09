//
//  DataConnectionApi.swift
//  class_45_api
//
//  Created by fahim expo on 7/11/20.
//

import Foundation

struct DataConnectionApi {
    
    let appConnect = "https://api.openweathermap.org/data/2.5/weather?appid=373cd7422b2140c6c4a6b4126319673d"
    
    
    func watherFunc (city: String){
        
        let addcityConcat = "\(appConnect)&q=\(city)"
        // print(addcityConcat)
        receiveDataFormApi(data1: addcityConcat)
    }
    
    func receiveDataFormApi (data1: String) {
        
        if let url = URL(string: data1) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let collectData = data {
                    
                    //  let convertdata = String(data: collectData, encoding: .utf8)
                    // print(convertdata!)
                    
                    
                    if let finalData = self.reciveDecodinigData(decoding: collectData) {
                        
                        
                        let  viewController = ViewController()
                        viewController.showCuntryName(temp: finalData)
                        
                    }
                    
                    
                }
                
            }
            task.resume()
        }
        
    }
    
    func reciveDecodinigData(decoding: Data) -> JsonModel? {
        
        
        let jsonDecoder = JSONDecoder()
        
        do {
            
            let storeDecoder = try jsonDecoder.decode(JsonData.self, from: decoding)
            print(storeDecoder.main.temp)
            
            let temp = storeDecoder.main.temp
            
            let jsonModel = JsonModel(tempShow: temp)
            
            
            return jsonModel
            
        } catch {
            print(error)
            return nil
        }
        
        
        
        
    }
    
}
