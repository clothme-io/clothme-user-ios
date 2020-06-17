////
////  UpdateTransformerViewModel.swift
////  Transformer
////
////  Created by MACPRO on 2019-06-07.
////  Copyright © 2019 Paul Ikhane. All rights reserved.
////
//
//import Foundation
//import RxSwift
//import RxCocoa
//
//class UpdateTransformerDetailViewModel: TransformerDetailViewModelType {
//
//    var title: BehaviorRelay<String> = BehaviorRelay<String>(value: "Update Transformer")
//    let disposeBag = DisposeBag()
//    
//    let onNavigateBack = PublishSubject<Void>()
//    let submitButtonTapped = PublishSubject<Void>()
//    var onShowLoadingProgress: Observable<Bool> {
//        return loadingProgress
//            .asObservable()
//            .distinctUntilChanged()
//    }
//    //Let onShowError = PublishSubject<SignleButtonAlert>()
//    var submitButtonEnabled: Observable<Bool> {
//        return Observable.combineLatest(isNameValid, isRankValid) { $0 && $1 }
//    }
//    
//    var name = BehaviorRelay<String>(value: "")
//    var strength = BehaviorRelay<Int>(value: 0)
//    var intelligence = BehaviorRelay<Int>(value: 0)
//    var speed = BehaviorRelay<Int>(value: 0)
//    var endurance = BehaviorRelay<Int>(value: 0)
//    var firepower = BehaviorRelay<Int>(value: 0)
//    var rank = BehaviorRelay<Int>(value: 0)
//    var type = BehaviorRelay<String>(value: "")
//    
//    
//    private let loadingProgress = BehaviorRelay(value: false)
//    private let apiClient: APIClient
//    private let transformerId: Int
//    
//    private var isNameValid: Observable<Bool> {
//        return name.asObservable().map({ $0.count > 0 })
//    }
//    
//    private var isRankValid: Observable<Bool> {
//        return strength.asObservable().map({ $0 > 0 })
//    }
//    
//    init() {
//        
//    }
//    
//}
