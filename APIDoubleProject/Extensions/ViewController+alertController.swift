//
//  ViewController+alertController.swift
//  APIDoubleProject
//
//  Created by user on 29.04.2021.
//

import UIKit

extension ViewController {
    //создадим предупреждение
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style,complectionHandler: @escaping(String) ->Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField{(textField) in
            let cities = ["Moscow","San Francisco","New York","Kiev","Minsk"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default){ action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else{return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "$20")
            complectionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    
    }
}

