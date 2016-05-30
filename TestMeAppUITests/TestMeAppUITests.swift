//
//  TestMeAppUITests.swift
//  TestMeAppUITests
//
//  Created by Mrudul Pendharkar on 29/05/16.
//  Copyright © 2016 ShreeVed. All rights reserved.
//

import XCTest

class TestMeAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    let staticTextCount:UInt = 3
    let buttonsCount:UInt = 5 //Hidden Back button + Actual Buttons on Screen
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
            XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testTitleOfApp() {
        // T1
        //Verify TestMeApp Title Exists
        XCTAssert(app.staticTexts["TestMeApp"].exists)
    }
    
    func testObjectsOnApp() {
        //Verify TestMeApp Title Exists Before Going Forward
        XCTAssert(app.staticTexts["TestMeApp"].exists)
        
        // T2
        //Verify Static Texts Count is as expected
        XCTAssertEqual(app.staticTexts.count, staticTextCount)
        
        // T3
        //Verify Button Count is as expected
        XCTAssertEqual(app.buttons.count, buttonsCount)
    }
    
    func testLabelTextChange(){
        //Verify TestMeApp Title Exists Before Going Forward
        XCTAssert(app.staticTexts["TestMeApp"].exists)
        
        // T4
        let changeLabelBtn = app.buttons["Change Label"]
        let changedText = app.staticTexts["Just a Label"]
        waitForElementToBecomeVisible(changeLabelBtn)
        waitForElementToAppearOnAction(changeLabelBtn, verifyElement: changedText,timeout: 30.0)
        
        XCTAssert(app.staticTexts["Changed Label"].exists)
    }
    
    func testLabelIsVisible(){
        //Verify TestMeApp Title Exists Before Going Forward
        XCTAssert(app.staticTexts["TestMeApp"].exists)
        
        // T5
        let makeMeVisibleBtn = app.buttons["Make Me Visible"]
        let iAmVisibleText = app.staticTexts["I am Visible"]
        waitForElementToAppearOnAction(makeMeVisibleBtn, verifyElement: iAmVisibleText)
        XCTAssert(iAmVisibleText.exists)
    }
    
    func testAlertBox(){
        //Verify TestMeApp Title Exists Before Going Forward
        XCTAssert(app.staticTexts["TestMeApp"].exists)
        
        // T6
        let openAlertBtn = app.buttons["Open Alert Box"]
        let iAmAlert = app.alerts["I am Alert"]
        waitForElementToAppearOnAction(openAlertBtn, verifyElement: iAmAlert)
        XCTAssert(iAmAlert.exists)
    }
    
    func testModalViewLaunch(){
        //Verify TestMeApp Title Exists Before Going Forward
        XCTAssert(app.staticTexts["TestMeApp"].exists)
        
        // T6
        let openModalBtn = app.buttons["Open Modal View"]
        let modalView = app.buttons["Back"]
        let modalText = app.staticTexts["Modal View Is Open Now"]
        waitForElementToAppearOnAction(openModalBtn, verifyElement: modalView,timeout: 30.0)
        XCTAssert(modalText.exists)
    }
    
    
    private func waitForElementToAppearOnAction(actionElement:XCUIElement, verifyElement:XCUIElement, timeout:NSTimeInterval=10.0){
        let existsPredicate = NSPredicate(format:"exists=true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: verifyElement, handler: nil)
        actionElement.tap()

        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    private func waitForElementToBecomeVisible(element:XCUIElement,timeout:NSTimeInterval=10.0){
        let existsPredicate = NSPredicate(format:"exists=true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }

}
