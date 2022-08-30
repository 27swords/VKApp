//
//  MyGroupsVC.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit
import RealmSwift

final class MyGroupsViewController: UIViewController {

    //MARK: - Inits
    private var gorups: [Group] = []
    private let service = GroupService()
    private let realmService = RealmCacheService()
    private var token: NotificationToken?
    private var groupResponse: Results<Group>? {
        try? realmService.read(Group.self)
    }
    
    //MARK: - Outlets
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(refresh),
                                 for: .valueChanged)
        return refreshControl
    }()
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        createNotificarionToken()
        service.loadGroup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTableView()
    }
}

//MARK: Extensions Delegate
extension MyGroupsViewController: AddGroupDelegate {
    func addGroup(id: Int, name: String) { }
}

//MARK: - Extension UITableView
extension MyGroupsViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - Objc Methods
    @objc func addButtonTapped() {
        let view = AllGroupsVC()
        view.delegate = self
        view.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(view, animated: true)
    }
   
    @objc private func refresh(sender: UIRefreshControl) {
        service.loadGroup()
        tableView.reloadData()
        sender.endRefreshing()
    }

    //MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupResponse?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? LargeIconItem
        else {
            return UITableViewCell()
        }
        if let groups = groupResponse {
            cell.configureCellForGroup(groups[indexPath.row])
        }
        return cell
    }
}

//MARK: - Private Extensions
private extension MyGroupsViewController {

    //MARK: - Animations
    private func animateTableView() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.height
        var delay: Double = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
            UIView.animate(withDuration: 1.5,
                           delay: delay * 0.05,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: { cell.transform = CGAffineTransform.identity })
            delay += 1
        }
    }
}

private extension MyGroupsViewController {
    func setupTableView() {
        let allGroupButton = UIBarButtonItem(title: "Добавить",
                                             style: .plain,
                                             target: self,
                                             action: #selector(addButtonTapped)
        )
        
        navigationItem.setRightBarButton(allGroupButton, animated: true)
        tableView.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LargeIconItem.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createNotificarionToken() {
        token = groupResponse?.observe { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .initial(let groupData):
                print("DBG token", groupData.count)
            case .update(_,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                let deletionsIndexPath = deletions.map { IndexPath(row: $0, section: 0) }
                let insertionsIndexPath = insertions.map { IndexPath(row: $0, section: 0) }
                let modificationsIndexPath = modifications.map { IndexPath(row: $0, section: 0) }
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.deleteRows(at: deletionsIndexPath, with: .automatic)
                    self.tableView.insertRows(at: insertionsIndexPath, with: .automatic)
                    self.tableView.reloadRows(at: modificationsIndexPath, with: .automatic)
                    self.tableView.endUpdates()
                }
            case .error(let error):
                print("DBG token Error", error)
            }
        }
    }
}
