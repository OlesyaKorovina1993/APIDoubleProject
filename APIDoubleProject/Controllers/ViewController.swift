//
//  ViewController.swift
//  APIDoubleProject
//
//  Created by user on 19.04.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var networkWeatherManager = NetworkWeatherManager()
    
    lazy var locationManager: CLLocationManager = {
        let locManager = CLLocationManager()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyKilometer//желаемая точность
        locManager.requestWhenInUseAuthorization()
        
        return locManager
    }()

    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    
    @IBOutlet weak var cityLabel: UILabel!

    
    @IBOutlet weak var temperatureLabel: UILabel!


    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {
            [unowned self] city in 
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onCompletion = { [weak self]
            currentWeather in
            guard let self = self else {return}
            self.updateIntergaceWith(weather: currentWeather)
        }
        if CLLocationManager.locationServicesEnabled(){
            locationManager.requestLocation()
        }
        
    }
    //обновить интерфейс с помощью...
    func updateIntergaceWith(weather: CurrentWeather){
        //очередь отправки
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.iconSystemName)
        }
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //обновление локации
        guard let location = locations.last else { return}
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}


