//
//  AddTaskViewController.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 12.10.2025.
//

import UIKit

protocol AddTaskDisplayLogic: AnyObject {
    func displaySaveTask(viewModel: AddTask.Save.ViewModel)
}

class AddTaskViewController: UIViewController {

    var interactor: AddTaskBusinessLogic?
    var router: IAddTaskRouter?

    private let titleLabel = UILabel()
    private let titleTextField = TextField()
    private let descriptionTextView = UITextView()
    private let saveButton = UIButton()

    // MARK: - Setup

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let interactor = AddTaskInteractor()
        let presenter = AddTaskPresenter()

        interactor.presenter = presenter
        presenter.viewController = self

        self.interactor = interactor
        self.router = AddTaskRouter()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "color/dark-gray-color")

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16).isActive = true

        titleLabel.textColor = .white
        titleLabel.text = "Создать задачу"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        stackView.addArrangedSubview(titleLabel)
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        titleTextField.placeholder = "Краткое описание"
        stackView.addArrangedSubview(titleTextField)
        titleTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        descriptionTextView.layer.cornerRadius = 4
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor(named: "color/gray-color")?.cgColor
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.textColor = .white
        descriptionTextView.font = .systemFont(ofSize: 14)
        descriptionTextView.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)
        stackView.addArrangedSubview(descriptionTextView)
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        saveButton.configuration = .filled()
        saveButton.configuration?.title = "Сохранить"
        saveButton.configuration?.baseForegroundColor = .white
        saveButton.configuration?.baseBackgroundColor = UIColor(named: "color/primary-color")
        saveButton.addTarget(self, action: #selector(onSaveButton), for: .touchUpInside)
        stackView.addArrangedSubview(saveButton)
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextField.becomeFirstResponder()
    }

    // MARK: - Selectors

    @objc
    private func onSaveButton(button: UIButton) {
        interactor?.saveTask(request: .init(
            name: titleTextField.text ?? "Новая задача",
            description: descriptionTextView.text ?? ""
        ))
    }
}

// MARK: - AddTaskDisplayLogic

extension AddTaskViewController: AddTaskDisplayLogic {

    func displaySaveTask(viewModel: AddTask.Save.ViewModel) {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
