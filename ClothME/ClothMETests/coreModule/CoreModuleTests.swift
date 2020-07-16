//
//  CoreModuleTests.swift
//  ClothMETests
//
//  Created by MACPRO on 2020-07-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import XCTest
@testable import Core

class CoreModuleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGet_ResultOptionValue() {
        
    }
    
    func testInit_WithGuid() {
        let sut = Guid(value: "Paul123")
        
        XCTAssertEqual(sut.toString(), "Paul123")
    }


}
