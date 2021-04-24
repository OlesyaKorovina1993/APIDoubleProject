//
//  ViewController.swift
//  APIDoubleProject
//
//  Created by user on 19.04.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    lazy var locationManager: CLLocationManager = {
        let locManager = CLLocationManager()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyKilometer//желаемая точность
        locManager.requestWhenInUseAuthorization()
        
        return locManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!


    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
}

