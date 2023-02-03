//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Марк Фокша on 03.02.2023.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    let feelsLikeTemp: Double
    
    var feelsLikeTempString: String {
        String(format: "%.1f", temperature)
    }
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800:       return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
     
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
