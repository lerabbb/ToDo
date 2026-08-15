//
//  TaskButtonCell.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

class TaskButtonCell: UITableViewCell {

    static let reuseId = "TaskButtonCell"

    private let button = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear

        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .clear
        button.addTarget(self, action: #selector(onButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

    func update(viewModel: TaskButtonViewModel) {
        button.configuration?.title = viewModel.title
        button.configuration?.baseForegroundColor = viewModel.titleColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors

    @objc private func onButtonDidTap(_ sender: UIButton) {
    }
}
