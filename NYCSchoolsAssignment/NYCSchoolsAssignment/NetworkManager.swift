//
//  NetworkManager.swift
//  NYCSchoolInfo
//
//  Created by Kevin Verghese on 9/6/23.
//

import Foundation

// Setting a generic function to return School List and School Info List
protocol NetworkRepresentable {
    func downloadSchoolList<T:Codable>(from url: URL, type: T.Type, _completion: @escaping (([School]) -> ()))
    func downloadSchoolResult<T:Codable>(from url: URL, type: T.Type, _completion: @escaping (([SchoolInfo]) -> ()))
}

class NetworkManager: NetworkRepresentable {
    
// Haven't handled error cases while networking and JSON parsing, will be done in next commit
    lazy var decoder = JSONDecoder()
    
    func downloadSchoolList<T>(from url: URL, type: T.Type, _completion: @escaping (([School]) -> ())) where T : Decodable, T : Encodable {
        URLSession.shared.dataTask(with: url) { [weak self] (data,_,error) in
            guard let data = data else {
                print("Error issuing JSON")
                return
            }
            do {
                let jsonData = try self?.decoder.decode([School].self, from: data)
                if let schoolListData = jsonData {
                    _completion(schoolListData)
                } else {
                    print("Error in parsing JSON")
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func downloadSchoolResult<T>(from url: URL, type: T.Type, _completion: @escaping (([SchoolInfo]) -> ())) where T : Decodable, T : Encodable {
        URLSession.shared.dataTask(with: url) { [weak self] (data,_,error) in
            guard let data = data else {
                print("Error issuing JSON")
                return
            }
            do {
                let jsonData = try self?.decoder.decode([SchoolInfo].self, from: data)
                if let schoolInfoData = jsonData {
                    _completion(schoolInfoData)
                } else {
                    print("Error in parsing JSON")
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
