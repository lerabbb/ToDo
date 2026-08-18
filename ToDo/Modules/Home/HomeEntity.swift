//
//  HomeEntity.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import UIKit

enum Home {
    enum FetchTasks {

        struct Request {

        }

        struct Response {
            let tasks: [Task]
        }

        struct ViewModel {
            let sections: [HomeSection]
        }
    }

    enum DeleteTask {
        struct Request {
            let id: UUID
        }
    }

    enum UpdateStatus {
        struct Request {
            let id: UUID
            let currentStatus: Status?
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
