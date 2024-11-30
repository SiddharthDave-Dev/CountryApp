//
//  ApiUrl.swift
//  CountryApp
//
//  Created by Siddharth Dave on 25/08/23.
//

import Foundation


class APIURL {
    
    static let shared = APIURL()
    
    let baseUrl = URL(string:"https://restcountries.com/v3.1/all")
    
    
}
