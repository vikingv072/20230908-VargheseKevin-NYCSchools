//
//  NYCSchoolsAssignmentTests.swift
//  NYCSchoolsAssignmentTests
//
//  Created by Kevin Verghese on 9/6/23.
//

import XCTest
@testable import VargheseKevin_NYCSchools

final class NYCSchoolsAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadSchoolList() {
        // Given
        let viewModel = SchoolViewModel(services: MockNetworkManager())

        // When
        viewModel.loadSchoolList()

        // Then
        XCTAssertEqual(viewModel.schoolsList.count, 2) // Assuming the mock provides 2 schools
    }
    
    func testLoadSchoolInfoList() {
        // Given
        let viewModel = SchoolViewModel(services: MockNetworkManager())

        // When
        viewModel.loadSchoolInfoList()

        // Then
        XCTAssertEqual(viewModel.schoolInfoList.count, 2) // Assuming the mock provides 2 school info items
        // Add more assertions as needed
    }

}
