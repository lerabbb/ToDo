//
//  Task.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import Foundation

enum Status {
    case new, inProgress, done

    var title: String {
        switch self {
        case .new:
            "Новая"
        case .inProgress:
            "В работе"
        case .done:
            "Выполнено"
        }
    }
}

struct Task {
    let id: String
    let name: String
    let description: String
    let creationDate: Date
    let status: Status

    func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: creationDate)
    }
}
