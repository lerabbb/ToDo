//
//  HomeRouter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import UIKit

protocol IHomeRouter: AnyObject {
    func routeToAddingTask()
    func routeToTaskDetail()
}

class HomeRouter: IHomeRouter {

    weak var viewController: UIViewController?

    // MARK: - IHomeRouter

    func routeToAddingTask() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.modalPresentationStyle = .pageSheet

        viewController?.navigationController?.present(addTaskVC, animated: true)
    }

    func routeToTaskDetail() {
        
    }
}
