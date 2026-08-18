//
//  AddTaskEntity.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

enum AddTask {

    enum Save {

        struct Request {
            let name: String
            let description: String
        }

        struct Response {
        }

        struct ViewModel {
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
