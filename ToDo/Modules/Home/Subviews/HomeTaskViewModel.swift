//
//  HomeTaskViewModel.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import Foundation

struct HomeTaskViewModel {

    let id: UUID?
    let name: String?
    let dateString: String?
    let status: Status?

    init(task: Task) {
        id = task.id
        name = task.name ?? ""
        dateString = task.creationDate?.getString()
        status = task.statusValue
    }
}
