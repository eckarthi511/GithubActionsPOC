//
//  HomeViewTests.swift
//  GithubTests
//
//  Created by Karthick R on 4/11/21.
//

import XCTest

class HomeViewTests: XCTestCase {
    var window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    static let homeVC: HomeViewController = HomeViewRouterProtocolMock.createHomeViewController()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.window.rootViewController = UINavigationController(rootViewController: HomeViewTests.homeVC)
        self.window.makeKeyAndVisible()
        HomeViewTests.homeVC.loadViewIfNeeded()
        HomeViewTests.homeVC.viewDidLoad()
        HomeViewTests.homeVC.callApi()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEQSuccessApi() {
        HomeViewTests.homeVC.presenter?.strApi = GithubApi
        mockApi()
    }
    
    func testEQApiWithEmptyUrl() {
        HomeViewTests.homeVC.presenter?.strApi = Empty_Text
        mockApi()
    }
    
    func testEQWithBadUrl() {
        HomeViewTests.homeVC.presenter?.strApi = StatusCode_Error
        mockApi()
    }
    
    func testEQApiWithDataError() {
        HomeViewTests.homeVC.presenter?.strApi = Data_Error
        mockApi()
    }
    
    func testEQApiWithDecodeError() {
        HomeViewTests.homeVC.presenter?.strApi = Decode_Error
        mockApi()
    }
    
    func testEQApiWithResponseError() {
        HomeViewTests.homeVC.presenter?.strApi = Response_Error
        mockApi()
    }
    
    func mockApi() {
        HomeViewTests.homeVC.presenter?.callGithubApi(completionHandler: { (result, errorString) in
            HomeViewTests.homeVC.activityIndicator.showActivityIndicator(false)
            if result {
                XCTAssertNotNil(HomeViewTests.homeVC.presenter?.objHomeViewDisplayEntityArray)
            }
            else if errorString == ApiUrl_Error {
                XCTAssertEqual(errorString, ApiUrl_Error)
                HomeViewTests.homeVC.showAlert(errorString)
            }
            else if errorString == StatusCode_Error {
                XCTAssertEqual(errorString, StatusCode_Error)
                HomeViewTests.homeVC.showAlert(errorString)
            }
            else if errorString == Data_Error {
                XCTAssertEqual(errorString, Data_Error)
                HomeViewTests.homeVC.showAlert(errorString)
            }
            else if errorString == Decode_Error {
                XCTAssertEqual(errorString, Decode_Error)
                HomeViewTests.homeVC.showAlert(errorString)
            }
            else if errorString == Response_Error {
                XCTAssertEqual(errorString, Response_Error)
                HomeViewTests.homeVC.showAlert(errorString)
            }
        })
    }

}
