
import Foundation

struct Temp: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dayKelvin = try container.decode(Double.self, forKey: .day)
        day = KelvinToCelsium(fromKelvin: dayKelvin)
        
        let minKelvin = try container.decode(Double.self, forKey: .min)
        min = KelvinToCelsium(fromKelvin: minKelvin)
        
        let maxKelvin = try container.decode(Double.self, forKey: .max)
        max = KelvinToCelsium(fromKelvin: maxKelvin)
        
        let nightKelvin = try container.decode(Double.self, forKey: .night)
        night = KelvinToCelsium(fromKelvin: nightKelvin)
        
        let eveKelvin = try container.decode(Double.self, forKey: .eve)
        eve = KelvinToCelsium(fromKelvin: eveKelvin)
        
        let mornKelvin = try container.decode(Double.self, forKey: .morn)
        morn = KelvinToCelsium(fromKelvin: mornKelvin)
    }
    
    let day: KelvinToCelsium
    let min: KelvinToCelsium
    let max: KelvinToCelsium
    let night: KelvinToCelsium
    let eve: KelvinToCelsium
    let morn: KelvinToCelsium
    
    enum CodingKeys: String, CodingKey {
        case day, min, max, night, eve, morn
    }
}
