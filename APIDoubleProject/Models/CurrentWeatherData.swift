//
//  CurrentWeatherData.swift
//  APIDoubleProject
//
//  Created by user on 23.04.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}
struct Main: Codable {
    let temp: Double
    let feelLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}
