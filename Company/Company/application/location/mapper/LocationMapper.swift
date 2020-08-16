//
//  LocationRepository.swift
//  Company
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class LocationMapper {
    
    static func toDomainModel(data: LocationApplicationModel) -> ResultOption<Location, AppError> {
        
        let locationId = LocationId.create(id: Guid(value: data.locationId)).OptionalData().value!
        let locationName = LocationName.create(with: data.locationName).OptionalData().value!
        let locationAddress = LocationAddress.create(
            streetNumber: data.locationAddress.streetNumber,
            streetName: data.locationAddress.streetName,
            city: data.locationAddress.city,
            country: data.locationAddress.country).OptionalData().value!
        let review = locationReviewModel(data: data)
        let operationDuration = OperationDuration.create(
            year: data.operationDuration.year,
            month: data.operationDuration.month,
            day: data.operationDuration.day).OptionalData().value!
        let launchDate = LocationLaunchDate.create(with: data.launchDate).OptionalData().value!
        let locationContact = LocationContact.create(
            email: data.locationContact.email,
            phoneNumber: data.locationContact.phoneNumber).OptionalData().value!
        
        let location = Location.create(
            locationId: locationId,
            locationName: locationName,
            locationAddress: locationAddress,
            review: review,
            operationDuration: operationDuration,
            launchDate: launchDate,
            locationContact: locationContact).OptionalData().value!
        
        return .ok(location)
        
     }
    
    private static func locationReviewModel(data: LocationApplicationModel) -> [LocationReview] {
        var index = 0
        var reviews = [LocationReview]()
        while data.review.count > index {
            let review = LocationReview.create(
                text: data.review[index].text,
                star: data.review[index].star).OptionalData().value!
            
            reviews.append(review)
            index += 1
        }
        return reviews
    }
     
     static func toDataModel(model: Location) -> LocationApplicationModel {
         return LocationApplicationModel(
            locationId: model.getLocationId().value().toIdString(),
            locationName: model.getLocationName().name,
            locationAddress: LocationAddressApplicationModel(
                streetNumber: model.getLocationAddress().streetNumber(),
                streetName: model.getLocationAddress().streetName(),
                city: model.getLocationAddress().city(),
                country: model.getLocationAddress().country()
            ),
            review: locationReviews(model: model),
            operationDuration: LocationOperationDurationApplicationModel(
                year: model.getLocationOperationDuration().year,
                month: model.getLocationOperationDuration().month,
                day: model.getLocationOperationDuration().day
            ),
            launchDate: model.getLaunchDate().date,
            locationContact: LocationContactApplicationModel(
                email: model.getLocationContact().email,
                phoneNumber: model.getLaunchDate().date)
        )
     }
    
    private static func locationReviews(model: Location) -> [LocationReviewApplicationModel] {
        var index = 0
        var reviews = [LocationReviewApplicationModel]()
        while model.getLeview().count > index {
            let review = LocationReviewApplicationModel(
                text: model.getLeview()[index].review,
                star: model.getLeview()[index].star)
            
            reviews.append(review)
            index += 1
        }
        return reviews
    }
    
}
