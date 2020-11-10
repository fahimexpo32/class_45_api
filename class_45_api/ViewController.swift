//
//  ViewController.swift
//  class_45_api
//
//  Created by fahim expo on 7/11/20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, WeatherProtocol, CLLocationManagerDelegate {
    
    
    
    
    
    
    
    @IBOutlet weak var mphShow: UILabel!
    @IBOutlet weak var humidityShow: UILabel!
    @IBOutlet weak var hazeShow: UILabel!
    
    @IBOutlet weak var cityNameShow: UILabel!
    
    @IBOutlet weak var textDataInput: UITextField!
    
    @IBOutlet weak var countryName: UILabel!
    var dataconnectionapi = DataConnectionApi()
    var locationIndentify = CLLocationManager()
    
    
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataconnectionapi.delegate = self
        locationIndentify.delegate = self
        
        locationIndentify.requestWhenInUseAuthorization()
        locationIndentify.requestLocation()
        
        
        
    }
    
    
    @IBAction func actionButton(_ sender: UIButton) {
        
        if let textBuindin  = textDataInput.text {
            dataconnectionapi.watherFunc(city: "\(textBuindin)")
            
        }
        
        
        
    }
    
    @IBAction func actionButtonReset(_ sender: UIButton) {
        
        
    }
    
    func showCuntryName(temp: JsonModel) {
        DispatchQueue.main.async {
            self.countryName.text = String( format: "%.f", temp.tempShow )
            
            self.cityNameShow.text = temp.cityName
            self.hazeShow.text = temp.hazeM
            self.humidityShow.text = String(temp.humidityM)
            self.mphShow.text = String(temp.speedMphM) 
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locationStore = locations.last {
            let longStore = locationStore.coordinate.longitude
            let latitudeStore = locationStore.coordinate.latitude
            print(longStore)
            print(latitudeStore)
            
            dataconnectionapi.longLat(log: longStore, lat: latitudeStore)
            
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

