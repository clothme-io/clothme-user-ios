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
        let name = FirstName.create(with: "Peteri")
        let firstName = name.getValue(result: name)
        XCTAssertEqual(firstName.value, "Peteri")
    }
    
    func testInit_Gender() {
        let gender = Gender.create(gender: "Female")
        let genderData = gender.getValue(result: gender)
        XCTAssertEqual(genderData.value, "Female")
    }
    
    func testInit_UserId() {
        let id = UserId.create(id: Guid(value: "1234"))
        let userId = id.getValue(result: id).value().toString()
        XCTAssertEqual(userId, "1234")
    }
    
    func testInit_BillingAddress() {
        let sAddress = StreetAddress.create(withApartment: "505", withStreetNumber: "32", withStreetName: "Clayland Drive")
        let streetAddress = sAddress.OptionalValue(result: sAddress)
        guard let apartment = streetAddress.optionalData?.apartment else { return }
        XCTAssertEqual(apartment, "505")
        XCTAssertEqual(streetAddress.optionalData?.number, "32")
        XCTAssertEqual(streetAddress.optionalData?.name, "Clayland Drive")
        
        let cAddress =  City.create(withCity: "Toronto")
        let city = cAddress.OptionalValue(result: cAddress)
        XCTAssertEqual(city.optionalData?.value, "Toronto")
        
        let codeAddress = ZipOrPostalCode.create(with: "M3A2A5")
        let zipOrPostalCode = codeAddress.OptionalValue(result: codeAddress)
        XCTAssertEqual(zipOrPostalCode.optionalData?.value, "M3A2A5")
        
        let coAddress = Country.set(country: "Canada")
        let country = coAddress.getValue(result: coAddress)
        XCTAssertEqual(country.value, "Canada")
        
        let bAddress = BillingAddress.create(with: streetAddress.optionalData!, with: city.optionalData!, with: country)
        let billingAddress = bAddress.OptionalValue(result: bAddress)
        
        XCTAssertEqual(billingAddress.optionalData?.city.value, "Toronto")
    }

}
