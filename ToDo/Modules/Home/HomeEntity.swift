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
            let sections: [IHomeSection]
        }
    }
}
