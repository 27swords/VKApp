//
//  FriendsVC.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit
import RealmSwift

final class FriendsViewController: UIViewController {
    
    //MARK: - Init
    private var friendService = FriendsService()
    private let realmService = RealmCacheService()
    private var friendResponse: Results<Friends>? {
        try? realmService.read(Friends.self)
    }
    private var token: NotificationToken?
    
    //MARK: - Outlets
    private lazy var tableview: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        friendService.loadFriends()
        createNotificationToken()
    }
}

//MARK: - Extension TableView
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendResponse?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? LargeIconItem
        else {
            return UITableViewCell()
        }
        if let friends = friendResponse {
            cell.configureCellForFriends(friends[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FriendsProfileVC()

        vc.friendID = String(friendResponse?[indexPath.section].id ?? 0)
        vc.friendID = String(friendResponse?[indexPath.row].id ?? 0)

        vc.hidesBottomBarWhenPushed = true

        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FriendsProfileVC {
            guard
                let vc = segue.destination as? FriendsProfileVC,
                let indexPathSection = tableview.indexPathForSelectedRow?.section,
                let indexPathRow = tableview.indexPathForSelectedRow?.row
            else {
                return
            }
            let section = friendResponse?[indexPathSection].id
            let path = friendResponse?[indexPathRow].id

            vc.friendID = String(section ?? 0)
            vc.friendID = String(path ?? 0)
        }
    }
}

//MARK: - Private Extension
private extension FriendsViewController {
    func setupTableView() {
        tableview.backgroundColor = #colorLiteral(red: 0.8283717036, green: 0.9270053506, blue: 0.8875589371, alpha: 1)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.separatorStyle = .none
        tableview.register(LargeIconItem.self, forCellReuseIdentifier: "Cell")
        tableview.showsVerticalScrollIndicator = false
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setupConstraints() {
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableview.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Create Token
    func createNotificationToken() {
        token = friendResponse?.observe { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .initial(let friendsData):
                print("DBG token", friendsData.count)
            case .update(_,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                
                let deletionIndexPath = deletions.map { IndexPath(row: $0, section: 0) }
                let insertionsIndexPath = insertions.map { IndexPath(row: $0, section: 0) }
                let modificationsIndexPath = modifications.map { IndexPath(row: $0, section: 0) }
                
                DispatchQueue.main.async {
                    self.tableview.beginUpdates()
                    self.tableview.deleteRows(at: deletionIndexPath, with: .automatic)
                    self.tableview.insertRows(at: insertionsIndexPath, with: .automatic)
                    self.tableview.reloadRows(at: modificationsIndexPath, with: .automatic)
                    self.tableview.endUpdates()
                }
            case .error(let error):
                print("DBG token Error", error)
            }
        }
    }
}
