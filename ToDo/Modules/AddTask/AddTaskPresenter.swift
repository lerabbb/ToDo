//
//  AddTaskPresenter.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

protocol AddTaskPresentationLogic: AnyObject {
    func presentSaveTask(response: AddTask.Save.Response)
    func presentError(response: AddTask.Error.Response)
}

class AddTaskPresenter: AddTaskPresentationLogic {

    weak var viewController: AddTaskDisplayLogic?

    // MARK: - AddTaskPresentationLogic

    func presentSaveTask(response: AddTask.Save.Response) {
        viewController?.displaySaveTask(viewModel: .init())
    }

    func presentError(response: AddTask.Error.Response) {
        viewController?.displayError(viewModel: .init(text: response.text))
    }
}
