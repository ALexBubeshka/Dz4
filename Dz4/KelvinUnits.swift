//
//  KelvinUnits.swift
//  Dz4
//
//  Created by Alexander Bubeshka on 27.07.22.
//

import Foundation

struct KelvinToCelsium {
    
    var temp: Double
    
    init(fromKelvin kelvin: Double) {
    temp = kelvin - 273.15
    }
}


