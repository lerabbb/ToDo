//
//  TaskTextSection.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

class TaskTextSection {

    let items: [TaskTextViewModel]

    init(task: Task) {
        var items: [TaskTextViewModel] = [
            .init(text: task.name, font: .boldSystemFont(ofSize: 20)),
            .init(text: task.statusValue.string, font: .systemFont(ofSize: 12)),
            .init(text: task.creationDate?.getString(), font: .systemFont(ofSize: 12))
        ].compactMap { $0 }

        var descriptionText = task.details ?? ""
        descriptionText = descriptionText.isEmpty ? "--" : descriptionText
        if let description = TaskTextViewModel(text: descriptionText, font: .systemFont(ofSize: 16)) {
            items.append(description)
        }
        
        self.items = items
    }
}

// MARK: - IHomeSection

extension TaskTextSection: TaskSection {

    var numberOfItems: Int {
        items.count
    }

    func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskTextCell.reuseId,
            for: indexPath
        )
        let cellData = items[indexPath.row]
        if let cell = cell as? TaskTextCell {
            cell.update(viewModel: cellData)
        }
        return cell
    }
}
