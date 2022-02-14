//
//  PresenterTest.swift
//  ViperArchitectureDemoTests
//
//  Created by joemon johny on 14/02/22.
//

import XCTest
@testable import ViperArchitectureDemo

class PresenterTest: XCTestCase {
    
    var presenter: NoticePresenter!
    var interactor = NoticeInteractorMock()
    var view = NoticeMockView()


    override func setUp() {
        presenter = NoticePresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    func testStartFetchingNotice() {
        
        let noticeName = "LeaveNotice"
        let noticeMessage = "Message"
        presenter.startFetchingNotice()
        guard let list = view.noticeList, list.count == 2, let noticeTitle = list[0].noticeTitle, let noticeDesc = list[0].noticeDescription else {
            XCTFail("invalid notice")
            return
        }
        XCTAssertEqual(noticeTitle, noticeName)
        XCTAssertEqual(noticeDesc, noticeMessage)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }

}

class NoticeInteractorMock:PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    let notice1 = NoticeModel(noticeTitle: "LeaveNotice", noticeDescription: "Message")
    let notice2 = NoticeModel(noticeTitle: "LeaveNote", noticeDescription: "Info")
    func fetchNotice() {
        presenter?.noticeFetchedSuccess(noticeArray: [notice1,notice2])
    }

}

class NoticeMockView: PresenterToViewProtocol {
    
    var presenter:ViewToPresenterProtocol?
    var noticeList:[NoticeModel]?
    
    func showNotice(noticeArray: [NoticeModel]) {
        noticeList = noticeArray
    }
    
    func showError() {
        
    }
}
