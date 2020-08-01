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
    
    
//    let userDomainModel = User.create(userId: UserId.create(id: Guid(value: "1234567")).OptionalData().value!, profileImage: ProfileImage.set(with: "12345").OptionalData().value, firstName: (FirstName.create(with: "Paul").OptionalData().value)!, lastName: LastName.create(value: "Ikhane").OptionalData().value, gender: Gender.create(gender: "male").OptionalData().value!, email: UserEmail.create(with: "paul.ikhane@outlook.com").OptionalData().value!, phoneNumber: [PhoneNumber.create(value: "4167602309", type: "cell").OptionalData().value!], city: City.create(withCity: "Toronto").OptionalData().value!, country: Country.set(country: "Canada").OptionalData().value!, dateOfBirth: DateOfBirth.create(date: "1981-04-19").OptionalData().value, profession: Profession.create(profession: "Software Engineer").OptionalData().value, tier: UserTier.set(tier: "free").OptionalData().value!, shippingAddress: [ShippingAddress.create(with: StreetAddress.create(withApartment: "505", withStreetNumber: "32", withStreetName: "Clayland Drive").OptionalData().value!, with: City.create(withCity: "Toronto").OptionalData().value!, with: ZipOrPostalCode.create(with: "M3A2A5").OptionalData().value!, and: Country.set(country: "Canada").OptionalData().value!).OptionalData().value!], billingAddress: [BillingAddress.create(with: StreetAddress.create(withApartment: "505", withStreetNumber: "32", withStreetName: "Clayland Drive").OptionalData().value!, with: City.create(withCity: "Toronto").OptionalData().value!, with: ZipOrPostalCode.create(with: "M3A2A5").OptionalData().value!, with: Country.set(country: "Canada").OptionalData().value!).OptionalData().value!])
  
    
//            let accountDomainModel = Account.create(with: UserId.create(id: Guid(value: "0987654")).OptionalData().value!, with: , and: NumberOfAccount.create(with: 1).OptionalData().value!)
            
            let accountApplicationModel = AccountApplicationModel(ownerId: "123789", accountUsers: [AccountUserApplicationModel(accountId: "0987654", userId: "65478", firstName: "Patrick", lastName: "Ikhane", dateOfBirth: "1982-07-13", gender: "male", phoneNumber: [PhoneNumberAppliastionModel(value: "4167602309", type: "cell")], relationship: "family", dateAdded: Date().timeIntervalSinceNow.description, shippingAddress: [AddressApplicationModel(apartmentNumber: "505", streetNumber: "32", streetName: "Clayland Drive", city: "Toronto", zipOrPostalCode: "M3A2A5", country: "Canada")], brandId: ["13579"])], numberOfAccount: 1)
        
            let connectionDomainModel = Connection.create(userId: UserId.create(id: Guid(value: "098321")).OptionalData().value!, numberOfConnection: NumberOfConnection.create(with: 3).OptionalData().value!)
            
            let connectionApplicationModel = ConnectionApplicationModel(connectedUser: [ConnectionUserApplicationModel(connectionId: "0981234", userId: "786123", firstName: "Peter", lastName: "Ikhane", city: "Ibadan", connectionDate: "2020-01-16", connectionDuration: 20)], numberOfConnection: 3)

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
        
        let billingAddress = BillingAddress.create(with: streetAddress.optionalData!, with: city!, with: codeAddress.OptionalData().value!, with: address!).OptionalData().value

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
    
    func testInit_DateOfBirth() {
        let stringDate = "1981-04-19"
        let date = DateOfBirth.create(date: stringDate).OptionalData().value!
        XCTAssertEqual(date.value, "1981-04-19")
    }
    
    func testInit_Age() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: stringDate)!
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        let dateString = formatter.string(from: date)
//        let dateOfBirth = dateString
    }
    
    func testInit_User_value() {
        let userId = UserId.create(id: Guid(value: "1234567")).OptionalData().value!
        XCTAssertEqual(userId.value().toString(), "1234567")
    }
    
    func testUserMapper_toDomainModel() {
        guard let accountId = AccountId.create(id: Guid(value: "0987123")).OptionalData().value else { return }
        guard let firstName = FirstName.create(with: "Patrick").OptionalData().value else { return }
        guard let dob = DateOfBirth.create(date: "1982-07-13").OptionalData().value else { return }
        guard let gender = Gender.create(gender: "male").OptionalData().value else { return }
        guard let relationship = RelationShip.create(with: "family").OptionalData().value else { return }
        guard let date = DateAdded.create().OptionalData().value else { return }
        guard let street = StreetAddress.create(withApartment: "505", withStreetNumber: "32", withStreetName: "Clayland Drive").OptionalData().value else { return }
        guard let country = Country.set(country: "Canada").OptionalData().value else { return }
        guard let city = City.create(withCity: "Toronto").OptionalData().value else { return }
        guard let code = ZipOrPostalCode.create(with: "M3A2A5").OptionalData().value else { return }
        
          let accountUser = AccountUser.create(accountId: accountId, userId: UserId.create(id: Guid(value: "65478")).OptionalData().value!, firstName: firstName, lastName: LastName.create(value: "Ikhane").OptionalData().value, dateOfBirth: dob, gender: gender, phoneNumber: [PhoneNumber.create(value: "4167602309", type: "cell").OptionalData().value], relationShip: relationship, dataAdded: date, shippingAddress: [ShippingAddress.create(with: street, with: city, with: code, and: country).OptionalData().value!], brandId: ["13579"])
//        XCTAssertEqual(accountUser, )
    }
    
    func testUserMapper_toDataModel() {
        
    }

}
