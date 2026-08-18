//
//  HomeRouter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import UIKit

protocol IHomeRouter: AnyObject {
    func routeToAddingTask()
    func routeToTaskDetail(taskId: UUID)
    func routeToMessage(title: String?, message: String?)
}

class HomeRouter: Router, IHomeRouter {

    // MARK: - IHomeRouter

    func routeToAddingTask() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.modalPresentationStyle = .pageSheet

        viewController?.navigationController?.pushViewController(addTaskVC, animated: true)
    }

    func routeToTaskDetail(taskId: UUID) {
        let taskVC = TaskViewController(taskId: taskId)
        taskVC.modalPresentationStyle = .pageSheet

        viewController?.navigationController?.pushViewController(taskVC, animated: true)
    }
}
