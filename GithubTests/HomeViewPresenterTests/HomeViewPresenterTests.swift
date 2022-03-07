//
//  HomeViewPresenterTests.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import XCTest

class HomeViewPresenterTests: XCTestCase {
    
    let presenter: HomeViewPresenterProtocolMock = HomeViewPresenterProtocolMock()
    let interactor: HomeViewInteractorProtocolMock = HomeViewInteractorProtocolMock()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter.interactor = interactor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGithubSuccessApi() {
        mockGithubApi(withApi: GithubApi)
    }
    
    func testGithubApiWithEmptyUrl() {
        mockGithubApi(withApi: Empty_Text)
    }
    
    func testGithubApiWithBadUrl() {
        mockGithubApi(withApi: StatusCode_Error)
    }
    
    func testGithubApiWithDataError() {
        mockGithubApi(withApi: Data_Error)
    }
    
    func testGithubApiWithDecodeError() {
        mockGithubApi(withApi: Decode_Error)
    }
    
    func testGithubApiWithResponseError() {
        mockGithubApi(withApi: Response_Error)
    }
    
    func mockGithubApi(withApi api:String) {
        presenter.strApi = api
        presenter.callGithubApi { (result, errorString) in
            if result {
                XCTAssertEqual(self.presenter.objHomeViewDisplayEntityArray?.count, 2)
            }
            else if errorString == ApiUrl_Error {
                XCTAssertEqual(ApiUrl_Error, errorString)
            }
            else if errorString == StatusCode_Error {
                XCTAssertEqual(StatusCode_Error, errorString)
            }
            else if errorString == Data_Error {
                XCTAssertEqual(Data_Error, errorString)
            }
            else if errorString == Decode_Error {
                XCTAssertEqual(Decode_Error, errorString)
            }
            else if errorString == Response_Error {
                XCTAssertEqual(Response_Error, errorString)
            }
        }
    }
}
