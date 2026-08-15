//
//  HomeTaskViewModel.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

struct HomeTaskViewModel {
    let name: String
    let dateString: String
    let statusString: String

    init(task: Task) {
        name = task.name
        dateString = task.getDateString()
        statusString = task.status.string
    }
}
