//
//  TransformerTableViewViewModel.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-06.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TransformerTableViewViewModel {
    var transformerCells: Observable<[TransformerTableViewCellType]> {
        return cells.asObservable()
    }
    var onShowLoadingProcess: Observable<Bool> {
        return loadingInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
    let onShowError = PublishSubject<SingleButtonAlert>()
    let apiClient: APIClient
    let disposeBag = DisposeBag()
    
    private let loadingInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[TransformerTableViewCellType]>(value: [])
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getTransformers() {
        loadingInProgress.accept(true)
        
        apiClient
            .getTransformers()
            .subscribe(onNext: { [weak self] transformers in
                self?.loadingInProgress.accept(false)
                guard transformers.count > 0 else {
                    self?.cells.accept([.empty])
                    return
                }
                self?.cells.accept(transformers.compactMap( {.normal (cellViewModel: TransformerCellViewModel (transformer: $0))}))
                },
            onError: { [weak self] error in
                self?.loadingInProgress.accept(false)
                self?.cells.accept([
                    .error(message: (error as? APIClient.GetTransformersFailure)?.getErrorMessage() ?? "Loading failed, check your network connection")])
                })
        .disposed(by: disposeBag)
    }
    
    func delete(transformer: TransformerCellViewModel) {
        apiClient
            .deleteFriend(id: transformer.id)
            .subscribe(onNext: { [weak self] transformer in
                self?.getTransformers()
                }, onError: { [weak self] error in
                    let alert = SingleButtonAlert(title: (error as? APIClient.DeleteTransformerFailure)?.getErrorMessage() ?? "Could not connect to server", message: "Could not remove \(transformer.name)", action: AlertAction(buttonTitle: "OK", handler: { print("Ok Pressed!")}))
                    self?.onShowError.onNext(alert)
                })
        .disposed(by: disposeBag)
    }
}

fileprivate extension APIClient.GetTransformersFailure {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to load your friends"
        case .notFound:
            return "Could not complete request, please try again"
        }
    }
}

fileprivate extension APIClient.DeleteTransformerFailure {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to remove friends"
        case .notFound:
            return "Friend not found"
        }
    }
}
