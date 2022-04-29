//
//  NetworkManager.swift
//  20220425-SivadattaKodali-NYCSchools
//
//  Created by Sivadatta Kodali on 4/25/22.
//

import Foundation

struct NetworkManager{
        
    /// Method to call the API with url
    /// - Parameters:
    ///   - url: The url for which to hit the API
    ///   - type: The response class to map the JSON data
    ///   - completion: Completion block to return the response model and error.
    static func fetchAPI<T : Codable>(with url:String, type: T.Type, completion: @escaping ([T]?,Error?) -> Void){
        guard let highScoolListURL = URL(string: url) else{
            return completion(nil,nil)
        }
        
        let dataTask = URLSession.shared.dataTask(with: highScoolListURL) { data, urlResponse, error in
            guard let jsonData = data, error == nil else{
                return completion(nil,error)
            }
            do{
                //Decode the JSON and convert to Swift Object Model
                let schoolsList  = try JSONDecoder().decode([T].self, from: jsonData)
                DispatchQueue.main.async {
                    completion(schoolsList,nil)
                }
            }catch let jsonError as NSError{
                // JSON decode failed
                print("JSON decode failed: \(jsonError.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
