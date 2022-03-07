//
//  HomeViewInteractorTests.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import XCTest

class HomeViewInteractorTests: XCTestCase {
    let interactor: HomeViewInteractorProtocolMock = HomeViewInteractorProtocolMock()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor.objNetworkManager = NetworkManagerTests()
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
        interactor.callGithubApi(strApi: api) { (result: Result<[HomeViewEntity], NetworkError>) in
            switch result {
            case .success(let objHomeViewEntity):
                XCTAssertEqual(objHomeViewEntity.count, 2)
            case .failure(let error):
                switch error {
                case .apiURLError:
                    XCTAssertEqual(error, .apiURLError)
                case .dataError:
                    XCTAssertEqual(error, .dataError)
                case .decodeError:
                    XCTAssertEqual(error, .decodeError)
                case .responseError:
                    XCTAssertEqual(error, .responseError)
                case .statusCodeError:
                    XCTAssertEqual(error, .statusCodeError)
                }
            }
        }
    }
}
