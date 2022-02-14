//
//  NoticeProtocols.swift
//  ViperArchitectureDemo
//
//  Created by joemon johny on 10/02/22.
//

import Foundation
import UIKit

// implements in presenter
protocol ViewToPresenterProtocol:class {
    
    var view:PresenterToViewProtocol? {get set}
    var interactor:PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol:class {
    func showNotice(noticeArray:[NoticeModel])
    func showError()
}

protocol PresenterToInteractorProtocol:class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
    
}
// implements in presenter
protocol InteractorToPresenterProtocol:class {
    func noticeFetchedSuccess(noticeArray:[NoticeModel])
    func noticeFetchedFailed()
}

protocol PresenterToRouterProtocol:class {
    static func createModule()->NoticeViewController
    func pushToMovieScreen(naigationController:UINavigationController)
    
}
