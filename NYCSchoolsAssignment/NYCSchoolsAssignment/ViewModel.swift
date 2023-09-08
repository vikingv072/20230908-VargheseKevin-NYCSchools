//
//  ViewModel.swift
//  NYCSchoolsAssignment
//
//  Created by Kevin Verghese on 9/7/23.
//

import Foundation

class SchoolViewModel {
    
    // updateViews Helps in binding the values to the table
    var updateViews: (() -> ())?
    var schoolsList = [School]() {
        didSet {
            self.updateViews?()
        }
    }
    var schoolInfoList = [SchoolInfo]()
    let services: NetworkRepresentable
    
    init(services: NetworkRepresentable) {
        self.services = services
    }
    
    func loadSchoolList() {
        guard let url = URL(string: APIEndpoints.schoolListEndpoint) else { return }
        self.services.downloadSchoolList(from: url, type: [School].self) { [weak self] schools in
            self?.schoolsList = schools
        }
    }
    
    func loadSchoolInfoList() {
        guard let url = URL(string: APIEndpoints.schoolResultEndpoint) else { return }
        self.services.downloadSchoolResult(from: url, type: [SchoolInfo].self) { [weak self] schoolInfo in
            self?.schoolInfoList = schoolInfo
        }
    }
}
