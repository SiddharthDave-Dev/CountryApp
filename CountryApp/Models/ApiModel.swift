//
//  ApiModel.swift
//  CountryApp
//
//  Created by Siddharth Dave on 25/08/23.
//

import Foundation


struct CountryName: Codable {
    
    let name: Common
    let flags: Image
}

struct Image: Codable {
    
    let png: String?
}

struct Common: Codable {
    
    let common: String?
    
}
