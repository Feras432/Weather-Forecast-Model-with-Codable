import UIKit


struct weather: Codable {
    var city: String
    var temperature: Int
    var condition: String
    var forecast: [Forecast]
    
}

    struct Forecast: Codable {
            var day: String
            var high: Int
            var low: Int
            var condition: String

}

let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}
""".data(using: .utf8)!
    

do {
    let weather = try JSONDecoder().decode(weather.self, from: jsonData)
    print(weather)
    
    for forecast in weather.forecast {
        print(forecast.day)
        print(forecast.high)
        print(forecast.low)
        print(forecast.condition)

    }
}
catch{
    print(error)
}
