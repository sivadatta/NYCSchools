//
//  SATResultDetailsTest.swift
//  20220425-SivadattaKodali-NYCSchoolsTests
//
//  Created by Sivadatta Kodali on 4/29/22.
//

import XCTest
@testable import _0220425_SivadattaKodali_NYCSchools

class SATResultTest: XCTestCase {
    
    var testSchoolDetailsViewModel : SchoolDetailsViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testSchoolDetailsViewModel = SchoolDetailsViewModel()
        testSchoolDetailsViewModel.schoolViewModel.value = [SchoolViewModel(dbn:"02M260", schoolName: "LOWER EAST SIDE PREPARATORY HIGH SCHOOL", numOfSatTestTakers: "112", satCriticalReadingAvgScore: "332", satMathAvgScore: "557", satWritingAvgScore:"316")]
        

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testSchoolDetailsViewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
        
    func testSATResultViewModel() throws{
        // Verify the SAT Result ViewModel
        XCTAssertTrue(testSchoolDetailsViewModel.schoolViewModel.value?.count ?? 0 > 0)
    }
    
    func testSchoolWithSATResult() throws{
        // Verify the School has SAT results
        XCTAssertNotNil(testSchoolDetailsViewModel.satResultsAvailable(results: testSchoolDetailsViewModel.schoolViewModel.value, for: "02M260"))
    }
    
    func testSATResultsAPI() throws{
        let expectation = expectation(description: "Success response while fetching SAT Results")

        NetworkManager.fetchAPI(with: AppConstants.satScoresUrl, type: SATResults.self) { data, error in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            XCTAssert(data?.count ?? 0 > 0, "SAT Results retrieved")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }



    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
