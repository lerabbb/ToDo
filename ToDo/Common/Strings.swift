//
//  Strings.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 19.08.2026.
//

struct Strings {

    static let ok = "Ок"
    static let save = "Сохранить"
    static let error = "Ошибка"
    static let defaultTaskName = "Новая задача"

    struct AddTask {
        static let createTask = "Создать задачу"
        static let titlePlaceholder = "Краткое описание"
    }

    struct Home {
        static let title = "Главная"
        static let question = "Что вы хотите сделать сегодня?"
        static let hint = "Нажмите +, чтобы добавить задачу"
    }

    struct TaskAction {
        static let work = "Взять в работу"
        static let execute = "Выполнить"
        static let delete = "Удалить"
    }

    struct TaskStatus {
        static let new = "Новая"
        static let inProgress = "В работе"
        static let done = "Выполнено"
    }
}
