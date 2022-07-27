
import Foundation

struct Minutely: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateDt = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateDt))
        
        precipitation = try container.decode(Double.self, forKey: .precipitation)
        
    }
    let dt: Date
    let precipitation: Double
    
    enum CodingKeys: String, CodingKey {
     
        case dt, precipitation
    }
}
