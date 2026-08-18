//
//  AddTaskInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import Foundation

protocol AddTaskBusinessLogic: AnyObject {
    func saveTask(request: AddTask.Save.Request)
}

class AddTaskInteractor: AddTaskBusinessLogic {

    var presenter: AddTaskPresentationLogic?

    private let taskManager = TaskManager()

    // MARK: - AddTaskBusinessLogic
    
    func saveTask(request: AddTask.Save.Request) {
        guard !request.name.isEmpty || !request.description.isEmpty else {
            return
        }
        taskManager.createTask(name: request.name, description: request.description) { [weak self] task, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.presenter?.presentError(response: .init(text: Strings.unknownError))
                    return
                }
                guard task != nil else {
                    return
                }
                self?.presenter?.presentSaveTask(response: .init())
            }
        }
    }
}
