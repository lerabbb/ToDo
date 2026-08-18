//
//  TaskRouter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

protocol ITaskRouter: AnyObject {
    func routeToMessage(title: String?, message: String?)
    func dismiss(animated: Bool)
}

class TaskRouter: Router, ITaskRouter {
}
