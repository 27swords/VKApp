//
//  NewsFeedViewController.swift
//  App
//
//  Created by Alexander Chervoncev on 18.08.22.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let newsFeedService = NewsFeedService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        newsFeedService.loadFeedNews()
        
        tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: NewsFeedTableViewCell.reuseId)
        tableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: NewsFeedTableViewCell.reuseId)
    }
}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTableViewCell.reuseId, for: indexPath) as! NewsFeedTableViewCell
        return cell
    }
}

private extension NewsFeedViewController {
    func setupTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.8265798688, green: 0.9259606004, blue: 0.8862180114, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
