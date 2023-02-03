//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Марк Фокша on 26.01.2023.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> ())?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        performURL(with: url)
    }
    
    func fetchCurrentWeather(forLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees ) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        performURL(with: url)
    }
    
    fileprivate func performURL(with urlString: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(String(describing: error))
        }
        return nil
    }
    
    
}
