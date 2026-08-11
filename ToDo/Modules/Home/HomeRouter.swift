//
//  HomeRouter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

protocol IHomeRouter: AnyObject {
    func routeToAddingTask()
    func routeToTaskDetail()
}

class HomeRouter: IHomeRouter {

    weak var viewController: UIViewController?

    func routeToAddingTask() {

    }

    func routeToTaskDetail() {
        
    }
}
