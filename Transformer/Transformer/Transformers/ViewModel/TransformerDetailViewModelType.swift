//
//  TransformerDetailViewModel.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

protocol TransformerDetailViewModelType {
    var title: BehaviorRelay<String> { get }
    var onNavigateBack: PublishSubject<Void> { get }
    var submitButtonTapped: PublishSubject<Void> { get }
    var onShowLoadingProgress: Observable<Bool> { get }
    var submitButtonEnabled: Observable<Bool> { get }
    //var onShowError: PublishSubject<SignleButtonAlert> { get }
    
    var name: BehaviorRelay<String> { get }
    var strength: BehaviorRelay<Int> { get }
    var intelligence: BehaviorRelay<Int> { get }
    var speed: BehaviorRelay<Int> { get }
    var endurance: BehaviorRelay<Int> { get }
    var firepower: BehaviorRelay<Int> { get }
    var rank: BehaviorRelay<Int> { get }
    var type: BehaviorRelay<String> { get }
    
}
