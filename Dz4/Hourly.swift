
import Foundation

struct Hourly: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateDt = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateDt))
        
        let tempKelvin = try container.decode(Double.self, forKey: .temp)
        temp = KelvinToCelsium(fromKelvin: tempKelvin)
        
        feelLike = try container.decode(Double.self, forKey: .feelLike)
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        
        let dewPointKelvin = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = KelvinToCelsium(fromKelvin: dewPointKelvin)
        
        uvi = try container.decode(Double.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Double.self, forKey: .windDeg)
        windGust = try container.decode(Double.self, forKey: .windGust)
        weather = try container.decode([Weather].self, forKey: .weather)
    }
    
    let dt: Date
    let temp: KelvinToCelsium
    let feelLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: KelvinToCelsium
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Double
    let windGust: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
     
        case dt, temp
        case feelLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}
