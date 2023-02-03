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
        "\(temperature.rounded())"
    }
    let feelsLikeTemp: Double
    
    var feelsLikeTempString: String {
        "\(feelsLikeTemp.rounded())"
    }
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
