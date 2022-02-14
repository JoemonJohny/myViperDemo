//
//  NoticeInteractor.swift
//  ViperArchitectureDemo
//
//  Created by joemon johny on 10/02/22.
//

import Foundation
import UIKit
class NoticeInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        // if api success
        presenter?.noticeFetchedSuccess(noticeArray: [])
        //else
        //presenter?.noticeFetchedFailed()
    }
    
    
}
