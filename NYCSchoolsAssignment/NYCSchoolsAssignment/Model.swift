//
//  Model.swift
//  NYCSchoolInfo
//
//  Created by Kevin Verghese on 9/6/23.
//

import Foundation

struct School: Codable  {
    let dbn: String
    let schoolName: String
    let borough: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case borough = "borough"
    }
}

struct SchoolInfo: Codable {
    let dbn: String
    let schoolName: String
    let readingScore: String
    let writingScore: String
    let mathScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case readingScore = "sat_critical_reading_avg_score"
        case writingScore = "sat_writing_avg_score"
        case mathScore = "sat_math_avg_score"
    }
}

