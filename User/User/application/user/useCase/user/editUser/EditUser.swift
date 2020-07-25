//
//  EditUser.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


struct EditUser : UseCaseAble {
    
    var _userRepo: UserRepository
    
    init(userRepo: UserRepository) {
        self._userRepo = userRepo
    }
    
    public func execute(with data: EditUserDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            let userIdOrError = UserId.create(id: Guid(value: data.userId)).isSuccess()
            if !userIdOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            
            if let profileImage = data.profileImage {
                let profileImageOrError = ProfileImage.set(with: profileImage).isSuccess()
                if !profileImageOrError {
                    return promise(.failure(AppError.accountAlreadyClosed))
                }
            }
            
            if let firstName = data.firstName {
                let firstNameOrError = FirstName.create(with: firstName).isSuccess()
                if !firstNameOrError {
                    return promise(.failure(AppError.firstNameCannotBeEmpty))
                }
            }
            
            if let lastName = data.lastName {
                let lastNameOrError = LastName.create(value: lastName).isSuccess()
                if !lastNameOrError {
                    return promise(.failure(AppError.emptyValueNotAllowed))
                }
            }
            
            if let gender = data.gender {
                let genderOrError = Gender.create(gender: String(gender)).isSuccess()
                if !genderOrError {
                    return promise(.failure(AppError.ageTooYoung))
                }
            }
            
            if let email = data.email {
                let emailOrError = UserEmail.create(with: email).isSuccess()
                if !emailOrError {
                    return promise(.failure(AppError.invalidEmail))
                }
            }
            
            if let phoneNumber = data.phoneNumber {
                let phoneNumberOrError = PhoneNumber.create(value: phoneNumber.number, type: phoneNumber.type).isSuccess()
                if !phoneNumberOrError {
                    return promise(.failure(AppError.invalidPhoneNumber))
                }
            }
            
            if let billingAddress = data.billingAddress {
                let streetAddress = StreetAddress.create(withApartment: billingAddress.streetAddress.apartmentNumber, withStreetNumber: billingAddress.streetAddress.streetNumber, withStreetName: billingAddress.streetAddress.streetName).OptionalData().value!
                let city = City.create(withCity: billingAddress.city).OptionalData().value!
                let zipOrPostalCode = ZipOrPostalCode.create(with: billingAddress.zipOrPostalCode).OptionalData().value!
                let country = Country.set(country: billingAddress.country).OptionalData().value!
                let addressOrError = BillingAddress.create(with: streetAddress, with: city, with: zipOrPostalCode, with: country).isSuccess()
                if !addressOrError {
                    return promise(.failure(AppError.ageTooYoung))
                }
            }
            
            if let dateOfBirth = data.dateOfBirth {
                let dobOrError = DateOfBirth.create(date: dateOfBirth).isSuccess()
                if !dobOrError {
                    return promise(.failure(AppError.dateOfBirthCannotBeEmpty))
                }
            }
            
            if let age = data.dateOfBirth {
                
            }
            
            if let profession = data.profession {
                let professionOrError = Profession.create(profession: profession).isSuccess()
                if !professionOrError {
                    return promise(.failure(AppError.emailMustBeProvided))
                }
            }
            
            self._userRepo.editUser(data: data) { (result, error) in
                if let error = error {
                    return promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        return promise(.success(UserMapper.toDataModel(user: result)))
                    }
                }
            }
        }
    }
}
