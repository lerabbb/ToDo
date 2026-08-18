//
//  HomeInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import Foundation

protocol HomeBusinessLogic: AnyObject {
    func fetchTasks(request: Home.FetchTasks.Request)
    func deleteTask(request: Home.DeleteTask.Request)
    func updateStatus(request: Home.UpdateStatus.Request)
}

class HomeInteractor: HomeBusinessLogic {

    var presenter: HomePresentationLogic?

    private let taskManager = TaskManager()

    // MARK: - HomeBusinessLogic

    func fetchTasks(request: Home.FetchTasks.Request) {
        taskManager.fetchTasks { [weak self] tasks, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.presenter?.presentError(response: .init(text: Strings.unknownError))
                    return
                }
                self?.presenter?.presentFetchTasks(response: .init(tasks: tasks))
            }
        }
    }

    func deleteTask(request: Home.DeleteTask.Request) {
        taskManager.deleteTask(by: request.id) { [weak self] error in
            guard error == nil else {
                self?.presenter?.presentError(response: .init(text: Strings.unknownError))
                return
            }
            self?.fetchTasks(request: .init())
        }
    }

    func updateStatus(request: Home.UpdateStatus.Request) {
        guard request.newStatus == request.currentStatus?.nextStatus else {
            return
        }
        taskManager.updateTask(id: request.id, status: request.newStatus) { [weak self] task, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.presenter?.presentError(response: .init(text: Strings.unknownError))
                    return
                }
                self?.fetchTasks(request: .init())
            }
        }
    }
}
