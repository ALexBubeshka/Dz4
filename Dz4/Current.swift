
import Foundation

struct Current: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateDt = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateDt))
        
         let dateSunrise = try container.decode(Int.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: TimeInterval(dateSunrise))
        
       
        let dateSunset = try container.decode(Int.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: TimeInterval(dateSunset))
            
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
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        weather = try container.decode([Weather].self, forKey: .weather)
        rain = try container.decode(Rain.self, forKey: .rain)
        }
    
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let temp: KelvinToCelsium
    let feelLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: KelvinToCelsium
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let rain: Rain
    

    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
        case temp
        case feelLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case rain
    }
}
