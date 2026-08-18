//
//  TaskButtonViewModel.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

struct TaskButtonViewModel {
    let type: ButtonType
}

enum ButtonType {
    case work
    case execute
    case delete

    var title: String {
        switch self {
        case .work:
            "Взять в работу"
        case .execute:
            "Выполнить"
        case .delete:
            "Удалить"
        }
    }

    var color: UIColor? {
        switch self {
        case .work, .execute:
            .white
        case .delete:
            UIColor(named: "color/red-color")
        }
    }
}
