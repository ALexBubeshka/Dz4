
import Foundation

struct Rain: Decodable {
    let h1: Double
    
    enum CodingKeys: String, CodingKey {
        case h1 = "1h"
    }
}

