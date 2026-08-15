//
//  HomeInteractor.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import Foundation

protocol HomeBusinessLogic: AnyObject {
    func fetchTasks(request: Home.FetchTasks.Request)
}

class HomeInteractor: HomeBusinessLogic {

    var presenter: HomePresentationLogic?

    // MARK: - HomeBusinessLogic

    func fetchTasks(request: Home.FetchTasks.Request) {
        presenter?.presentFetchTasks(response: .init(tasks: [
            .init(
                id: "1",
                name: "First task",
                description: "this is little description",
                creationDate: .now,
                status: .new
            )
        ]))
    }
}
