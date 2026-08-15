//
//  TaskSection.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

protocol TaskSection: AnyObject {

    var numberOfItems: Int { get }

    func createCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell?
}
