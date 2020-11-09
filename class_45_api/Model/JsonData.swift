//
//  JsonData.swift
//  class_45_api
//
//  Created by Ramjan Hossain on 7/11/20.
//

import Foundation

struct JsonData: Codable {
    
    let coord: Coord
    let weather: [Weather]
    let sys: Sys
    let wind: Wind
    let main: Main
    
    
    let visibility: Int
    let dt: Int
    let cod: Int
    let name: String
}


struct Main: Codable {
    
    let temp: Double
    let temp_min: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
    
}

struct Sys: Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    
   	
    
}
