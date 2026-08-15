//
//  TaskButtonSection.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

class TaskButtonSection {

    let items: [TaskButtonViewModel]

    init?(status: Status) {
        let items: [TaskButtonViewModel]
        switch status {
        case .new:
            items = [
                .init(title: "Взять в работу", titleColor: .white),
                .init(title: "Удалить", titleColor: UIColor(named: "color/red-color"))
            ]
        case .inProgress:
            items = [.init(title: "Выполнить", titleColor: .white)]
        case .done:
            items = []
        }
        
        guard !items.isEmpty else {
            return nil
        }
        self.items = items
    }
}

// MARK: - TaskSection

extension TaskButtonSection: TaskSection {

    var numberOfItems: Int {
        items.count
    }

    func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskButtonCell.reuseId,
            for: indexPath
        )
        let cellData = items[indexPath.row]
        if let cell = cell as? TaskButtonCell {
            cell.update(viewModel: cellData)
        }
        return cell
    }
}
