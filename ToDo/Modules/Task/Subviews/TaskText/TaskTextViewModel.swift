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

    init(text: String, font: UIFont) {
        self.text = text
        self.font = font
    }
}
