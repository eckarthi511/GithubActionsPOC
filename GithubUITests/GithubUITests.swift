//
//  GithubUITests.swift
//  GithubUITests
//
//  Created by Karthick R on 4/11/21.
//

import XCTest

class GithubUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Added Author, CommitHash & CommitMsg labels to HomeViewTVCell and committed the changes"]/*[[".cells.staticTexts[\"Added Author, CommitHash & CommitMsg labels to HomeViewTVCell and committed the changes\"]",".staticTexts[\"Added Author, CommitHash & CommitMsg labels to HomeViewTVCell and committed the changes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["056071ffb09a2c09f9ec34d63a566e12ce1d295c"]/*[[".cells.staticTexts[\"056071ffb09a2c09f9ec34d63a566e12ce1d295c\"]",".staticTexts[\"056071ffb09a2c09f9ec34d63a566e12ce1d295c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["5ed74c762c84d48587491861b616b426dde65889"]/*[[".cells.staticTexts[\"5ed74c762c84d48587491861b616b426dde65889\"]",".staticTexts[\"5ed74c762c84d48587491861b616b426dde65889\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["d9de779b63a69dc243a9954a0f28b5eba9fcd0c8"]/*[[".cells.staticTexts[\"d9de779b63a69dc243a9954a0f28b5eba9fcd0c8\"]",".staticTexts[\"d9de779b63a69dc243a9954a0f28b5eba9fcd0c8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["b1cdd7b4b0cb260339aed9d59dfc17c9a7bd0ba4"]/*[[".cells.staticTexts[\"b1cdd7b4b0cb260339aed9d59dfc17c9a7bd0ba4\"]",".staticTexts[\"b1cdd7b4b0cb260339aed9d59dfc17c9a7bd0ba4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["d434f44b790b6bfc555d0742cf3fc9ac7edbb316"]/*[[".cells.staticTexts[\"d434f44b790b6bfc555d0742cf3fc9ac7edbb316\"]",".staticTexts[\"d434f44b790b6bfc555d0742cf3fc9ac7edbb316\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
