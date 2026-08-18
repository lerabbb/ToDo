//
//  TaskInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

import Foundation

protocol TaskBusinessLogic: AnyObject {
    func fetchTask(request: TaskEntity.FetchTask.Request)
    func deleteTask(request: TaskEntity.DeleteTask.Request)
    func updateStatus(request: TaskEntity.UpdateStatus.Request)
}

class TaskInteractor: TaskBusinessLogic {

    var presenter: TaskPresentationLogic?

    let taskId: UUID

    private var task: Task?

    private let taskManager = TaskManager()

    init(taskId: UUID) {
        self.taskId = taskId
    }


    // MARK: - TaskBusinessLogic
    
    func fetchTask(request: TaskEntity.FetchTask.Request) {
        taskManager.fetchTask(by: taskId) { [weak self] task, error in
            DispatchQueue.main.async {
                self?.showTask(task, error: error)
            }
        }
    }

    func deleteTask(request: TaskEntity.DeleteTask.Request) {
        taskManager.deleteTask(by: taskId) { [weak self] error in
            guard error == nil else {
                self?.presenter?.presentError(response: .init(text: error?.localizedDescription ?? ""))
                return
            }
            self?.presenter?.presentDeleteTask(response: .init())
        }
    }

    func updateStatus(request: TaskEntity.UpdateStatus.Request) {
        guard request.newStatus == task?.statusValue.nextStatus else {
            return
        }
        taskManager.updateTask(id: taskId, status: request.newStatus) { [weak self] task, error in
            DispatchQueue.main.async {
                self?.showTask(task, error: error)
            }
        }
    }

    // MARK: - Private

    private func showTask(_ task: Task?, error: Error?) {
        guard error == nil else {
            presenter?.presentError(response: .init(text: error?.localizedDescription ?? ""))
            return
        }
        guard let task else {
            return
        }
        self.task = task
        presenter?.presentTask(response: .init(task: task))
    }
}
