
import Foundation

struct Daily: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateDt = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateDt))
        
        let dateSunrise = try container.decode(Int.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: TimeInterval(dateSunrise))
        
        let dateSunset = try container.decode(Int.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: TimeInterval(dateSunset))
        
        let dateMoonrise = try container.decode(Int.self, forKey: .moonrise)
        moonrise = Date(timeIntervalSince1970: TimeInterval(dateMoonrise))
        
        let dateMoonset = try container.decode(Int.self, forKey: .moonset)
        moonset = Date(timeIntervalSince1970: TimeInterval(dateMoonset))
        
        moonPhase = try container.decode(Double.self, forKey: .moonPhase)
        temp = try container.decode(Temp.self, forKey: .temp)
        
        feelLike = try container.decode(FeelLike.self, forKey: .feelLike)
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        
        let dewPointKelvin = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = KelvinToCelsium(fromKelvin: dewPointKelvin)
        
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        weather = try container.decode([Weather].self, forKey: .weather)
        clouds = try container.decode(Int.self, forKey: .clouds)
        pop = try container.decode(Double.self, forKey: .pop)
        rain = try container.decode(Double.self, forKey: .rain)
        uvi = try container.decode(Double.self, forKey: .uvi)
    }
    
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let moonrise: Date
    let moonset: Date
    let moonPhase: Double
    let temp: Temp
    let feelLike: FeelLike
    let pressure: Int
    let humidity: Int
    let dewPoint: KelvinToCelsium
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double
    let uvi: Double
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset,moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, rain, uvi
    }
}
