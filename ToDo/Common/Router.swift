//
//  Router.swift
//  ToDo
//
//  Created by Валерия Базаргуроева on 19.08.2026.
//

import UIKit

class Router {

    weak var viewController: UIViewController?

    func routeToMessage(title: String?, message: String?) {
        guard let viewController else {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default))
        viewController.present(alert, animated: true)
    }

    func dismiss(animated: Bool) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
}
