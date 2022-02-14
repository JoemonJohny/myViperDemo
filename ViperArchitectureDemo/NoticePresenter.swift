//
//  NoticePresenter.swift
//  ViperArchitectureDemo
//
//  Created by joemon johny on 10/02/22.
//

import Foundation
import UIKit

class NoticePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(naigationController: navigationController)
    }
    
}

extension NoticePresenter:InteractorToPresenterProtocol {
    func noticeFetchedSuccess(noticeArray: [NoticeModel]) {
        view?.showNotice(noticeArray: noticeArray)
    }
    
    func noticeFetchedFailed() {
        view?.showError()
    }
    
}
