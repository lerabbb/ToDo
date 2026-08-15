//
//  TaskViewController.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 13.08.2026.
//

import UIKit

protocol TaskDisplayLogic: AnyObject {
    func displayTask(viewModel: TaskEntity.FetchTask.ViewModel)
}

class TaskViewController: UIViewController {

    var interactor: TaskBusinessLogic?
    var router: ITaskRouter?

    private let tableView = UITableView()

    private var sections: [TaskSection] = []

    // MARK: - Setup

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    func setup() {
        let presenter = TaskPresenter()
        let interactor = TaskInteractor()

        interactor.presenter = presenter
        presenter.viewController = self

        self.interactor = interactor
        self.router = TaskRouter()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "color/background-color")
        navigationController?.navigationBar.tintColor = .white

        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTextCell.self, forCellReuseIdentifier: TaskTextCell.reuseId)
        tableView.register(TaskButtonCell.self, forCellReuseIdentifier: TaskButtonCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        interactor?.fetchTask(request: .init())
    }
}

// MARK: - UITableViewDataSource

extension TaskViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < sections.count else
        {
            return 0
        }
        return sections[section].numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sections[indexPath.section].createCell(tableView: tableView, indexPath: indexPath)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension TaskViewController: UITableViewDelegate {

}

// MARK: - TaskDisplayLogic

extension TaskViewController: TaskDisplayLogic {

    func displayTask(viewModel: TaskEntity.FetchTask.ViewModel) {
        DispatchQueue.main.async {
            self.sections = viewModel.sections
            self.tableView.reloadData()
        }
    }
}
