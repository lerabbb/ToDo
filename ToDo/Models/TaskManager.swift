//
//  TaskManager.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 19.08.2026.
//

import Foundation

class TaskManager {

    let storage = TaskStorage.shared

    private let queue = DispatchQueue(label: "TaskManager", qos: .userInitiated)

    func fetchTasks(completion: @escaping ([Task], Error?) -> Void) {
        queue.async { [weak self] in
            do {
                let tasks = try self?.storage.fetchTasks() ?? []
                completion(tasks, nil)
            } catch {
                completion([], error)
            }
        }
    }

    func fetchTask(by id: UUID, completion: @escaping (Task?, Error?) -> Void) {
        queue.async { [weak self] in
            do {
                let task = try self?.storage.fetchTask(by: id)
                completion(task, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func createTask(name: String, description: String, completion: @escaping (Task?, Error?) -> Void) {
        queue.async { [weak self] in
            do {
                let task = try self?.storage.createTask(name: name, description: description)
                completion(task, nil)
            }
            catch {
                completion(nil, error)
            }
        }
    }

    func deleteTask(by id: UUID, completion: @escaping (Error?) -> Void) {
        queue.async { [weak self] in
            do {
                try self?.storage.deleteTask(by: id)
                completion(nil)
            }
            catch {
                completion(error)
            }
        }
    }

    func updateTask(id: UUID, status: Status, completion: @escaping (Task?, Error?) -> Void) {
        queue.async { [weak self] in
            do {
                let task = try self?.storage.updateTask(id: id, status: status)
                completion(task, nil)
            }
            catch {
                completion(nil, error)
            }
        }
    }
}
