//
//  SchoolsListTest.swift
//  20220425-SivadattaKodali-NYCSchoolsTests
//
//  Created by Sivadatta Kodali on 4/29/22.
//

import XCTest
@testable import _0220425_SivadattaKodali_NYCSchools

class SchoolsListTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSchoolListViewModel() throws{
        let testSchoolListViewModel = SchoolListViewModel()
        testSchoolListViewModel.schoolsTableViewCellViewModel.value = [SchoolTableViewCellViewModel(schoolName: "Quest to Learn", dbn: "02M260")]
        XCTAssertTrue(testSchoolListViewModel.schoolsTableViewCellViewModel.value?.count ?? 0 > 0)
    }
    
    func testFetchSchoolAPI() throws{
        let expectation = expectation(description: "Success response while fetching schools list")

        NetworkManager.fetchAPI(with: AppConstants.schoolListUrl, type: School.self) { data, error in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            XCTAssert(data?.count ?? 0 > 0, "Schools List retrieved")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)

    }
}
