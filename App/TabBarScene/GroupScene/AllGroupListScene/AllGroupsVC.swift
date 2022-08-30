//
//  AllGroupsVC.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit

//MARK: - Procotol
protocol AddGroupDelegate: AnyObject {
    func addGroup(id: Int, name: String)
}

final class AllGroupsVC: UIViewController {
    
    //MARK: - Init
    private var groups: [Group] = []
    private var filteredGroups: [Group] = []
    private let service = GroupService()
    private let realmService = RealmCacheService()
    
    weak var delegate: AddGroupDelegate?
    
    //MARK: - Outlets
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        service.loadGroup()
    }
}

//MARK: - Extensions SearchBar
extension AllGroupsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.isEmpty ? " ": searchText
        filteredGroups = []
        service.searchGroups(text: text) { [weak self] result in
            switch result {
            case .success(let groups):
                self?.filteredGroups = groups
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - Extensions TableView
extension AllGroupsVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredGroups.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? LargeIconItem
        else {
            return UITableViewCell()
        }
        cell.configureCellForGroup(filteredGroups[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = filteredGroups[indexPath.row].id
        let group = filteredGroups[indexPath.row]
        delegate?.addGroup(id: id, name: group.name)
        service.addGroup(id: id) { result in
            switch result {
            case .success(let join):
                if join.response == 1 {
                    self.realmService.create(group)
                }
            case .failure(let error):
                print(error)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Private Extensions
private extension AllGroupsVC {
    func setupTableView() {
        view.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        searchBar.placeholder = "Поиск"
        searchBar.barTintColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LargeIconItem.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        [searchBar, tableView].forEach { view.addSubview($0) }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

