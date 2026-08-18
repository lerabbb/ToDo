//
//  HomePresenter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

protocol HomePresentationLogic: AnyObject {
    func presentFetchTasks(response: Home.FetchTasks.Response)
    func presentError(response: Home.Error.Response)
}

class HomePresenter: HomePresentationLogic {

    weak var viewController: HomeDisplayLogic?

    // MARK: - HomePresentationLogic

    func presentFetchTasks(response: Home.FetchTasks.Response) {
        let sections = [HomeTasksSection(tasks: response.tasks)].compactMap { $0 }
        viewController?.displayFetchTasks(viewModel: .init(sections: sections))
    }

    func presentError(response: Home.Error.Response) {
        viewController?.displayError(viewModel: .init(text: response.text))
    }
}
