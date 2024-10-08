//
//  dev_ex_iosUITestsLaunchTests.swift
//  dev-ex-iosUITests
//
//  Created by Sukrit Chatmeeboon on 22/4/2567 BE.
//

import XCTest

final class dev_ex_iosUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "LaunchScreen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
