//
//  NoticeRouter.swift
//  ViperArchitectureDemo
//
//  Created by joemon johny on 10/02/22.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterProtocol {
    
    static func createModule() -> NoticeViewController {
        let view =  mainstoryboard.instantiateViewController(withIdentifier: "NoticeViewController") as! NoticeViewController
        let presenter:ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor:PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        return view
    }
    
    func pushToMovieScreen(naigationController: UINavigationController) {
        
    }
    
    static var mainstoryboard: UIStoryboard {
            return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
