//
//  TrashListViewController.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit
import SnapKit

class TrashListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(TrashTableViewCell.self, forCellReuseIdentifier: TrashTableViewCell.identifier)
        view.dataSource = self
        view.delegate = self
        view.estimatedRowHeight = UITableView.automaticDimension
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                try await FirebaseManager.shared.getTrashItems()
            } catch {
                print(error)
            }
            
        }
        

        view.addSubview(tableView)

        setUpNavBar()
        setConstraints()
    }
    
    func setUpNavBar() {
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapAddTrash))
    }


}

extension TrashListViewController {
    
    @objc func didTapAddTrash() {
        let vc = AddTrashViewController()
        present(vc, animated: true)
    }
    
}

extension TrashListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrashTableViewCell.identifier, for: indexPath) as! TrashTableViewCell
        
        cell.configureCell(trashModel: TrashTableViewModel(trashTitle: "Looooh", trashImage: UIImage(named: "logo")!, trashDescription: "aueee"))
        
        return cell
    }
    
    
}

extension TrashListViewController: UITableViewDelegate {
    
}

extension TrashListViewController {
    
    func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
}
