//
//  HomeViewController.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 11.08.2026.
//

import UIKit

protocol HomeDisplayLogic: AnyObject
{
    func displayFetchTasks(viewModel: Home.FetchTasks.ViewModel)
    func displayError(viewModel: Home.Error.ViewModel)
}

class HomeViewController: UIViewController {

    var router: IHomeRouter?
    var interactor: HomeBusinessLogic?

    private let placeholderImageView = UIImageView()
    private let questionLabel = UILabel()
    private let hintLabel = UILabel()
    private let addButton = UIButton()
    private let tableView = UITableView()

    private var sections: [HomeSection] = []

    // MARK: - Setup

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let router = HomeRouter()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self

        self.interactor = interactor
        self.router = router
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        view.backgroundColor = UIColor(named: "color/background-color")

        placeholderImageView.image = UIImage(named: "home/placeholder")
        placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderImageView)
        placeholderImageView.widthAnchor.constraint(equalToConstant: 227).isActive = true
        placeholderImageView.heightAnchor.constraint(equalToConstant: 227).isActive = true
        placeholderImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true

        questionLabel.text = "Что вы хотите сделать сегодня?"
        questionLabel.textColor = .white
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionLabel.topAnchor.constraint(equalTo: placeholderImageView.bottomAnchor, constant: 10).isActive = true

        hintLabel.text = "Нажмите +, чтобы добавить задачу"
        hintLabel.textColor = .white
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hintLabel)
        hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hintLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10).isActive = true
        hintLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true

        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTaskCell.self, forCellReuseIdentifier: HomeTaskCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(named: "color/gray-color")
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl

        addButton.configuration = .filled()
        addButton.configuration?.image = UIImage(named: "home/add")
        addButton.configuration?.baseBackgroundColor = UIColor(named: "color/primary-color")
        addButton.configuration?.cornerStyle = .capsule
        addButton.addTarget(self, action: #selector(onAddButton), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        addButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchTasks(request: .init())
    }

    // MARK: - Selectors

    @objc
    private func onAddButton(_ sender: UIButton) {
        router?.routeToAddingTask()
    }

    @objc
    private func onRefresh() {
        interactor?.fetchTasks(request: .init())
    }

    // MARK: - Private

    private func getItem(by indexPath: IndexPath) -> HomeTaskViewModel? {
        guard indexPath.section < sections.count else {
            return nil
        }
        let section = sections[indexPath.section]
        guard indexPath.row < section.numberOfItems else {
            return nil
        }
        return section.getItem(by: indexPath.row) as? HomeTaskViewModel
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

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

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let item = getItem(by: indexPath), let id = item.id else {
            return nil
        }
        let availableButtons = item.status?.availableButtons ?? []

        var actions: [UIContextualAction] = []
        for buttonType in availableButtons {
            let isDestructive = buttonType == .delete
            let action = UIContextualAction(style: isDestructive ? .destructive : .normal, title: buttonType.title) { [weak self] (_, _, completion) in
                switch buttonType {
                case .work:
                    self?.interactor?.updateStatus(request: .init(id: id, currentStatus: item.status, newStatus: .inProgress))
                case .execute:
                    self?.interactor?.updateStatus(request: .init(id: id, currentStatus: item.status, newStatus: .done))
                case .delete:
                    self?.interactor?.deleteTask(request: .init(id: id))
                }
                completion(true)
            }
            if !isDestructive {
                action.backgroundColor = UIColor(named: "color/primary-color")
            }
            
            actions.append(action)
        }

        return UISwipeActionsConfiguration(actions: actions)
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = getItem(by: indexPath), let id = item.id else {
            return
        }
        router?.routeToTaskDetail(taskId: id)
    }
}

// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayLogic {

    func displayFetchTasks(viewModel: Home.FetchTasks.ViewModel) {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            let isEmpty = viewModel.sections.isEmpty
            self.tableView.isHidden = isEmpty
            self.placeholderImageView.isHidden = !isEmpty
            self.questionLabel.isHidden = !isEmpty
            self.hintLabel.isHidden = !isEmpty
            self.sections = viewModel.sections
            self.tableView.reloadData()
        }
    }

    func displayError(viewModel: Home.Error.ViewModel) {
        router?.routeToMessage(title: "Ошибка", message: viewModel.text)
    }
}
