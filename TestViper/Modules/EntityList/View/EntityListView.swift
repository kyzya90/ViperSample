//  
//  EntityListView.swift
//  TestViper
//
//  Created by Alexander Kazmin on 2/11/19.
//  Copyright © 2019 Alexander Kazmin. All rights reserved.
//

import Foundation
import UIKit


final class EntityListView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private enum Localized {

        private static var bundle: Bundle {
            return Bundle(for: EntityListView.self)
        }
    }

    private enum Constants {
        static let cellIdentifier: String = "EntityCell"
    }
    
    // MARK: Public Properties

    public var delegate: EntityListViewDelegate?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate?.viewDidLoad(self)
    }
}


// MARK: - EntityListViewType

extension EntityListView: EntityListViewType {
    func reloadList() {
        self.tableView.reloadData()
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

extension EntityListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let requiredDelegate = self.delegate else { return 0 }
        return requiredDelegate.numberOfEntities()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let requiredDelegate = self.delegate,
              let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
        else { fatalError("Could not create cell") }

        let viewModel = requiredDelegate.entity(at: indexPath.row)
        cell.textLabel?.text = viewModel.name
        cell.textLabel?.textColor = viewModel.nameColor
        cell.detailTextLabel?.text = viewModel.value
        cell.detailTextLabel?.textColor = viewModel.valueColor

        return cell
    }


}
