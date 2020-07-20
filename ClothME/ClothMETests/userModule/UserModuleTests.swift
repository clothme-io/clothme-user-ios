//
//  UserModuleTests.swift
//  ClothMETests
//
//  Created by MACPRO on 2020-07-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import XCTest
@testable import User

class UserModuleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_FirstName() {
        let name = FirstName.create(name: "Peteri")
        let firstName = name.getValue(result: name)
        
        XCTAssertEqual(firstName.value, "Peteri")
        
        
    }

}
