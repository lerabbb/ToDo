//
//  HomePresenter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

protocol HomePresentationLogic: AnyObject {
    func presentFetchTasks(response: Home.FetchTasks.Response)
}

class HomePresenter: HomePresentationLogic {

    weak var viewController: HomeDisplayLogic?

    func presentFetchTasks(response: Home.FetchTasks.Response) {
        let sections = [HomeTasksSection(tasks: response.tasks)]
        viewController?.displayFetchTasks(viewModel: .init(sections: sections))
    }
}
