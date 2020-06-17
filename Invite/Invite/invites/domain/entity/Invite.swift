//
//  Invite.swift
//  Invite
//
//  Created by MACPRO on 2020-04-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class Invite {
    private let _inviteId: InviteId
    private var _sentDate: SentDate
    private var _acceptedDate: AcceptedDate
    private var _sentBy: String
    private var _receivedBy: String
    private var _inviteType: InviteType
    
    private init(id: InviteId, sentDate: SentDate, acceptedDate: AcceptedDate, sentBy: String, receiveBy: String, inviteType: InviteType) {
        self._inviteId = id
        self._sentDate = sentDate
        self._acceptedDate = acceptedDate
        self._sentBy = sentBy
        self._receivedBy = receiveBy
        self._inviteType = inviteType
    }
    
    public static func create(id: InviteId, sentDate: SentDate, acceptedDate: AcceptedDate, sentBy: String, receiveBy: String, inviteType: InviteType) -> ResultOption<Invite, ValidationError> {
        return .ok(Invite(id: id, sentDate: sentDate, acceptedDate: acceptedDate, sentBy: sentBy, receiveBy: receiveBy, inviteType: inviteType))
    }
    
    var id : InviteId {
        return self._inviteId
    }
    
    var sentDate: SentDate {
        return self._sentDate
    }
    
    public func change() {}
}
