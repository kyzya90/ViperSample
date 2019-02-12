//  
//  CreateEntityView.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit

final class CreateEntityView: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var createEntityButton: UIButton!
    @IBOutlet weak var showListButton: UIButton!

    // MARK: - Public Properties

    public var delegate: CreateEntityViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate?.viewDidLoad(self)
    }

    // MARK: - Actions
    @IBAction func DidTapCreateButton(_ sender: Any) {
        self.delegate?.didTapCreateEntityButton(self.createEntityButton,
                                                name: nameTextField.text ?? "",
                                                value: valueTextField.text ?? "")
    }

    @IBAction func didTapListButton(_ sender: Any) {
        self.delegate?.didTapShowListButton(self.showListButton)
    }
}

// MARK: - CreateEntityViewType

extension CreateEntityView: CreateEntityViewType {

    func setup(with viewModel: CreateEntityViewModel) {
        self.nameTextField.placeholder = viewModel.namePlaceholder
        self.nameTextField.text = viewModel.name
        self.valueTextField.text = viewModel.value
        self.valueTextField.placeholder = viewModel.valuePlaceholder
    }

    func showError(with title: String, description: String) {
        self.showAlertController(with: title,
                                 description: description)
    }

    private func showAlertController(with title: String, description: String) {
        let alertController = UIAlertController(title: title,
                                                message: description,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        alertController.addAction(action)
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
}
