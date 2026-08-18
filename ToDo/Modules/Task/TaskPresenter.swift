//
//  TaskPresenter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

protocol TaskPresentationLogic: AnyObject {
    func presentTask(response: TaskEntity.FetchTask.Response)
    func presentDeleteTask(response: TaskEntity.DeleteTask.Response)
    func presentError(response: TaskEntity.Error.Response)
}

class TaskPresenter: TaskPresentationLogic {

    weak var viewController: TaskDisplayLogic?

    // MARK: - TaskPresentationLogic

    func presentTask(response: TaskEntity.FetchTask.Response) {
        let sections: [TaskSection?] = [
            TaskTextSection(task: response.task),
            TaskButtonSection(status: response.task.statusValue)
        ]
        viewController?.displayTask(viewModel: .init(sections: sections.compactMap { $0 }))
    }

    func presentDeleteTask(response: TaskEntity.DeleteTask.Response) {
        viewController?.displayDeleteTask(viewModel: .init())
    }

    func presentError(response: TaskEntity.Error.Response) {
        viewController?.displayError(viewModel: .init(text: response.text))
    }
}
