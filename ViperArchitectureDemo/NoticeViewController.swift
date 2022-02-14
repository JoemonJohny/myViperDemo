//
//  ViewController.swift
//  ViperArchitectureDemo
//
//  Created by joemon johny on 10/02/22.
//

import UIKit

class NoticeViewController: UIViewController {

    var presenter:ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.startFetchingNotice()
    }


}

extension NoticeViewController: PresenterToViewProtocol {
    func showNotice(noticeArray: [NoticeModel]) {
        // populate the data into tableview and reload data
    }
    
    func showError() {
        // show errror to the view
    }
    
    
}
