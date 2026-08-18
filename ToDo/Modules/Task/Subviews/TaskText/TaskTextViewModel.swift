//
//  TaskTextViewModel.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 15.08.2026.
//

import UIKit

struct TaskTextViewModel {

    let text: String
    let font: UIFont

    init?(text: String?, font: UIFont) {
        guard let text, !text.isEmpty else {
            return nil
        }
        self.text = text
        self.font = font
    }
}
