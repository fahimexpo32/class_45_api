//
//  DataConnectionApi.swift
//  class_45_api
//
//  Created by fahim expo on 7/11/20.
//

import Foundation
import CoreLocation
protocol WeatherProtocol {
    func showCuntryName(temp: JsonModel)
}

struct DataConnectionApi {
    
    let appConnect = "https://api.openweathermap.org/data/2.5/weather?appid=373cd7422b2140c6c4a6b4126319673d"
    
    var delegate: WeatherProtocol?
    
    func watherFunc (city: String){
        
        let addcityConcat = "\(appConnect)&q=\(city)"
        // print(addcityConcat)
        receiveDataFormApi(data1: addcityConcat)
    }
    
    func longLat(log: CLLocationDegrees,lat: CLLocationDegrees) {
        let addLogLat = "\(appConnect)&lat=\(lat)&lon=\(log)"
        receiveDataFormApi(data1: addLogLat)
    }
    
    func receiveDataFormApi (data1: String) {
        
        if let url = URL(string: data1) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let collectData = data {
                    
                    let convertdata = String(data: collectData, encoding: .utf8)
                    print(convertdata!)
                    
                    
                    if let finalData = self.reciveDecodinigData(decoding: collectData) {
                        
                        delegate?.showCuntryName(temp: finalData)
                        
                        //                        let  viewController = ViewController()
                        //                        viewController.showCuntryName(temp: finalData)
                        //
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
            //    return Int(5.0 / 9.0 * (Double(fahrenheit) - 32.0))
           let  temp2 = (temp - 32) / 9
            
            let cityName1 = storeDecoder.name
            let desHaze = storeDecoder.weather[0].description
            let humidity1 = storeDecoder.main.humidity
            let speedmph1 = storeDecoder.wind.speed
            
            let jsonModel = JsonModel(tempShow: temp2 , cityName: cityName1,  hazeM: desHaze,humidityM: humidity1 ,speedMphM: speedmph1 )
            
            
            return jsonModel
            
        } catch {
            print(error)
            return nil
        }
        
        
        
        
    }
    
}
