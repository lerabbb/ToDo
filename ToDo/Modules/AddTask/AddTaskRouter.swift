//
//  AddTaskRouter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

import UIKit

protocol IAddTaskRouter: AnyObject {
    func routeToMessage(title: String?, message: String?)
    func dismiss(animated: Bool)
}

class AddTaskRouter: Router, IAddTaskRouter {
}
