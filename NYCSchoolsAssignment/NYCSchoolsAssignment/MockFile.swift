//
//  MockFile.swift
//  NYCSchoolsAssignment
//
//  Created by Kevin Verghese on 9/8/23.
//

import Foundation

class MockNetworkManager: NetworkRepresentable {
    func downloadSchoolList<T: Codable>(from url: URL, type: T.Type, _completion: @escaping (([School]) -> ())) {
        // Simulate a successful network request with mock data
        let mockData = """
        [
            { "dbn": "0912","school_name": "School 1", "borough": "D" },
            { "dbn": "02112", "school_name": "School 2","borough": "M" }
        ]
        """.data(using: .utf8)!
        
        do {
            let schools = try JSONDecoder().decode([School].self, from: mockData)
            _completion(schools)
        } catch {
            print("Error decoding mock data: \(error)")
            _completion([])
        }
    }

    func downloadSchoolResult<T: Codable>(from url: URL, type: T.Type, _completion: @escaping (([SchoolInfo]) -> ())) {
        // Simulate a successful network request with mock data
        let mockData = """
        [
            { "dbn": "0912","school_name": "School 1", "sat_critical_reading_avg_score": "398", "sat_writing_avg_score": "405", "sat_math_avg_score": "522" },
            { "dbn": "02112", "school_name": "School 2","sat_critical_reading_avg_score": "382", "sat_writing_avg_score": "562", "sat_math_avg_score": "473"}
        ]
        """.data(using: .utf8)!
        
        do {
            let schoolInfo = try JSONDecoder().decode([SchoolInfo].self, from: mockData)
            _completion(schoolInfo)
        } catch {
            print("Error decoding mock data: \(error)")
            _completion([])
        }
    }
}
