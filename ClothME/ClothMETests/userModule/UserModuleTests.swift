//
//  UserModuleTests.swift
//  ClothMETests
//
//  Created by MACPRO on 2020-07-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import XCTest
@testable import User
@testable import Core

class UserModuleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_FirstName() {
        let firstName = FirstName.create(with: "Peteri").OptionalData().value?.value
        XCTAssertEqual(firstName, "Peteri")
    }
    
    func testInit_Gender() {
        let gender = Gender.create(gender: "Female").OptionalData().value?.value
        XCTAssertEqual(gender, "Female")
    }
    
    func testInit_UserId() {
        let userId = UserId.create(id: Guid(value: "1234")).OptionalData().value?.value().toString()
        XCTAssertEqual(userId, "1234")
    }
    
    func testInit_BillingAddress() {
        let sAddress = StreetAddress.create(withApartment: "505", withStreetNumber: "32", withStreetName: "Clayland Drive")
        let streetAddress = sAddress.OptionalValue(result: sAddress)
        guard let apartment = streetAddress.optionalData?.apartment else { return }
        XCTAssertEqual(apartment, "505")
        XCTAssertEqual(streetAddress.optionalData?.number, "32")
        XCTAssertEqual(streetAddress.optionalData?.name, "Clayland Drive")
        
        let city =  City.create(withCity: "Toronto").OptionalData().value
        XCTAssertEqual(city?.value, "Toro")
        
        let codeAddress = ZipOrPostalCode.create(with: "M3A2A5")
        let zipOrPostalCode = codeAddress.OptionalValue(result: codeAddress)
        XCTAssertEqual(zipOrPostalCode.optionalData?.value, "M3A2A5")
        
        let address = Country.set(country: "Canada").OptionalData().value
        XCTAssertEqual(address?.value, "Canada")
        
        let billingAddress = BillingAddress.create(with: streetAddress.optionalData!, with: city!, with: address!).OptionalData().value

        XCTAssertEqual(billingAddress?.city.value, "Toronto")
    }
    
    func testInit_Success_Or_Failure() {
        let name: String? = "nil"
        guard let name1 = name else {
            return
        }
        let lastName = LastName.create(value: name1).isSuccess()
        XCTAssertEqual(lastName, true)
    }

}
