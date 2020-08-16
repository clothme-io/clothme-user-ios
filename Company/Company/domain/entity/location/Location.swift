//
//  Location.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Location: Entity {
    private let _locationId: LocationId
    private let _locationName: LocationName
    private let _locationAddress: LocationAddress
    private let _review: [LocationReview]
    private let _operationDuration: OperationDuration
    private let _launchDate: LocationLaunchDate
    private let _locationContact: LocationContact
    
    private init(
        locationId: LocationId,
        locationName: LocationName,
        locationAddress: LocationAddress,
        review: [LocationReview],
        operationDuration: OperationDuration,
        launchDate: LocationLaunchDate,
        locationContact: LocationContact
    ) {
        self._locationId = locationId
        self._locationName = locationName
        self._locationAddress = locationAddress
        self._review = review
        self._operationDuration = operationDuration
        self._launchDate = launchDate
        self._locationContact = locationContact
        super.init(_id: Guid(value: locationId.value().toIdString()))
    }
    
    static func create(
        locationId: LocationId,
        locationName: LocationName,
        locationAddress: LocationAddress,
        review: [LocationReview],
        operationDuration: OperationDuration,
        launchDate: LocationLaunchDate,
        locationContact: LocationContact
    ) -> ResultOption<Location, AppError> {
        return .ok(Location(
            locationId: locationId,
            locationName: locationName,
            locationAddress: locationAddress,
            review: review,
            operationDuration: operationDuration,
            launchDate: launchDate,
            locationContact: locationContact)
        )
    }
    
    func getLocationId() -> LocationId {
        return self._locationId
    }
    
    func getLocationName() -> LocationName {
        return self._locationName
    }
    
    func getLocationAddress() -> LocationAddress {
        return self._locationAddress
    }
    
    func getLeview() -> [LocationReview] {
        return self._review
    }
    
    func getLperationDuration() -> OperationDuration {
        return self._operationDuration
    }
    
    func getLaunchDate() -> LocationLaunchDate {
        return self._launchDate
    }
    
    func getLocationContact() -> LocationContact {
        return self._locationContact
    }
    
}
