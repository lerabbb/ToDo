//
//  AddTaskInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

protocol AddTaskBusinessLogic: AnyObject {
    func saveTask(request: AddTask.Save.Request)
}

class AddTaskInteractor: AddTaskBusinessLogic {

    var presenter: AddTaskPresentationLogic?

    // MARK: - AddTaskBusinessLogic
    
    func saveTask(request: AddTask.Save.Request) {
        guard !request.name.isEmpty || !request.description.isEmpty else {
            return
        }
        presenter?.presentSaveTask(response: .init())
    }
}
