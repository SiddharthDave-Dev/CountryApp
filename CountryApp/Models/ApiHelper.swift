//
//  ApiHelper.swift
//  CountryApp
//
//  Created by Siddharth Dave on 25/08/23.
//

import Foundation


class ApiHelper {
    
    static let sharedInstance = ApiHelper()
    
    func CountrysInfo (completion: @escaping ([CountryName]) -> Void ) {
        
        guard let url = APIURL.shared.baseUrl else { return }
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error with \(error)")
            }
            
            guard let data = data else { return
                print(data as Any)
            }
            
            if response != nil {
                
                let decoder = JSONDecoder()
                do {
                    let resData = try decoder.decode([CountryName].self, from: data )
                    completion(resData)
                    print(resData)
                } catch{
                    print(error)
                }
//                do {
//                let resdata = try decoder.decode(CountryName.self, from: data)
//                    completion(resdata.country)
//
//                } catch {
//                    print(error)
//                }
            }
        }
        task.resume()
    }
}
