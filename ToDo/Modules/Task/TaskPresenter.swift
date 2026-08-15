//
//  TaskPresenter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

protocol TaskPresentationLogic: AnyObject {
    func presentTask(response: TaskEntity.FetchTask.Response)
}

class TaskPresenter: TaskPresentationLogic {

    weak var viewController: TaskDisplayLogic?

    // MARK: - TaskPresentationLogic

    func presentTask(response: TaskEntity.FetchTask.Response) {
        let sections: [TaskSection?] = [
            TaskTextSection(task: response.task),
            TaskButtonSection(status: response.task.status)
        ]
        viewController?.displayTask(viewModel: .init(sections: sections.compactMap { $0 }))
    }
}
