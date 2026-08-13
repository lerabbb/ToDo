//
//  TextField.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

import UIKit

class TextField: UITextField {

    var textInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "color/gray-color")?.cgColor
        backgroundColor = .clear
        textColor = .white
        font = .systemFont(ofSize: 14)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
}
