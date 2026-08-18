//
//  TaskEntity.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

import Foundation

enum TaskEntity {

    enum FetchTask {
        
        struct Request {
        }

        struct Response {
            let task: Task
        }

        struct ViewModel {
            let sections: [TaskSection]
        }
    }

    enum DeleteTask {
        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
        }
    }

    enum UpdateStatus {
        struct Request {
            let newStatus: Status
        }
    }

    enum Error {
        struct Response {
            let text: String
        }

        struct ViewModel {
            let text: String
        }
    }
}
