//
//  TaskInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

protocol TaskBusinessLogic: AnyObject {
    func fetchTask(request: TaskEntity.FetchTask.Request)
}

class TaskInteractor: TaskBusinessLogic {

    var presenter: TaskPresentationLogic?

    // MARK: - TaskBusinessLogic
    
    func fetchTask(request: TaskEntity.FetchTask.Request) {
        presenter?.presentTask(response: .init(task: Task(
            id: "1",
            name: "Новая задача",
            description: "",
            creationDate: .now,
            status: .new
        )))
    }
}
