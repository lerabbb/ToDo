//
//  HomeTaskSection.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import UIKit

protocol HomeSection: AnyObject {

    var numberOfItems: Int { get }

    func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell?
    func getItem(by row: Int) -> Any?
}

class HomeTasksSection {

    let items: [HomeTaskViewModel]

    init?(tasks: [Task]) {
        guard !tasks.isEmpty else {
            return nil
        }
        items = tasks.map { HomeTaskViewModel(task: $0) }
    }
}

extension HomeTasksSection: HomeSection {

    var numberOfItems: Int {
        items.count
    }

    func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTaskCell.reuseId,
            for: indexPath
        )
        let cellData = items[indexPath.row]
        if let cell = cell as? HomeTaskCell {
            cell.update(viewModel: cellData)
        }
        return cell
    }

    func getItem(by row: Int) -> Any? {
        items[row]
    }
}
