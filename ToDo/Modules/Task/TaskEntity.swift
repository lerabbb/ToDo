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
}
