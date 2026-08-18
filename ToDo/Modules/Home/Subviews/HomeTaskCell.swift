//
//  HomeTaskCell.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.08.2026.
//

import UIKit

class HomeTaskCell: UITableViewCell {

    static let reuseId = "HomeTaskCell"

    private let titleLabel = UILabel()
    private let statusLabel = UILabel()
    private let dateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        stackView.addArrangedSubview(titleLabel)

        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textColor = UIColor(named: "color/gray-color")
        stackView.addArrangedSubview(statusLabel)

        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = UIColor(named: "color/gray-color")
        stackView.addArrangedSubview(dateLabel)

        contentView.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
    }

    func update(viewModel: HomeTaskViewModel) {
        titleLabel.text = viewModel.name
        statusLabel.text = viewModel.status?.string
        dateLabel.text = viewModel.dateString
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
