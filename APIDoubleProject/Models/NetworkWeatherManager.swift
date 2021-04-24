//
//  NetworkWeatherManager.swift
//  APIDoubleProject
//
//  Created by user on 23.04.2021.
//

import Foundation
import CoreLocation

struct NetworkWeatherManager {
    enum RequestType{ //перечисление типов запроса
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    func fetchCurrentWeather(forRequestType requestType: RequestType){
        var urlString = ""
        switch requestType {
        case .cityName(let city): urlString = "api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        case.coordinate(let latitude, let longitude): urlString = "api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        }
        
    }
    fileprivate func performRequest(withURLString urlString: String){
        
    }
    
    
    fileprivate func parseJSON(){
        
    }
}
