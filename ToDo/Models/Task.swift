//
//  Task.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import Foundation

enum Status: Int64 {
    case new
    case inProgress
    case done

    var string: String {
        switch self {
        case .new: Strings.TaskStatus.new
        case .inProgress: Strings.TaskStatus.inProgress
        case .done: Strings.TaskStatus.done
        }
    }

    var nextStatus: Status? {
        switch self {
        case .new: .inProgress
        case .inProgress: .done
        case .done: nil
        }
    }

    var availableButtons: [ButtonType] {
        switch self {
        case .new:
            [.work, .delete]
        case .inProgress:
            [.execute]
        case .done:
            []
        }
    }
}

extension Task {
    
    var statusValue: Status {
        return Status(rawValue: status) ?? .new
    }
}

extension Date {

    func getString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
