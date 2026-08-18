//
//  TaskStorage.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 18.08.2026.
//

import CoreData

enum TaskError: Error {
    case notFound
}

class TaskStorage {

    static let shared = TaskStorage()

    private let container: NSPersistentContainer

    private var context: NSManagedObjectContext {
        container.viewContext
    }

    init() {
        let container = NSPersistentContainer(name: "ToDo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        self.container = container
    }

    func fetchTasks() throws -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        return try context.fetch(request)
    }

    func fetchTask(by id: UUID) throws -> Task? {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        request.fetchLimit = 1
        return try context.fetch(request).first
    }

    func createTask(name: String, description: String) throws -> Task {
        let task = Task(context: context)
        task.id = UUID()
        task.name = name
        task.details = description
        task.creationDate = .now
        task.status = Status.new.rawValue

        try saveContext()
        return task
    }

    func deleteTask(by id: UUID) throws {
        guard let task = try? fetchTask(by: id) else {
            throw TaskError.notFound
        }
        context.delete(task)
        try saveContext()
    }

    func updateTask(id: UUID, status: Status) throws -> Task {
        guard let task = try? fetchTask(by: id) else {
            throw TaskError.notFound
        }
        task.status = status.rawValue
        try saveContext()
        return task
    }

    // MARK: - Private

    private func saveContext () throws {
        guard context.hasChanges else {
            return
        }
        do {
            try context.save()
        } catch {
            context.rollback()
            throw error
        }
    }
}
