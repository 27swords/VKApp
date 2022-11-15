//
//  NewsWallViewController.swift
//  App
//
//  Created by Alexander Chervoncev on 11.11.22.
//

import UIKit
import SwiftUI

final class NewsWallViewController: UIViewController {
    
    //MARK: - Views
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Inits
    var newsWallModel = NewsWallModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
        setupConstraints()
    }
}
//MARK: - TableView Extension
extension NewsWallViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsWallModel.newsWall.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsWallModel.newsWall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NamePublicCell", for: indexPath) as? NamePublicTableViewCell
            let headerCell = newsWallModel.newsWall[indexPath.section]
            
            cell?.configureHeaderCell(header: headerCell)
            
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as? DescriptionTableViewCell
            let textDescription = newsWallModel.newsWall[indexPath.section]
            cell?.configureTextDescription(text: textDescription)
            
            if textDescription.description == nil {
                cell?.isHidden = true
            }
            
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoDescription", for: indexPath) as? PhotoDescriptionTableViewCell
            let photoDescription = newsWallModel.newsWall[indexPath.section]
            cell?.configureDescriptionPhoto(photo: photoDescription)
            
            if photoDescription.imageDescription == nil {
                cell?.isHidden = true
            }
            
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonTableViewCell
            let likeCount = newsWallModel.newsWall[indexPath.section]
            
            cell?.configureLikes(likeCount: likeCount)
            
            return cell ?? UITableViewCell()
        }
    }
    
}

//MARK: - Private Extension
private extension NewsWallViewController {
    func setupTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(NamePublicTableViewCell.self, forCellReuseIdentifier: "NamePublicCell")
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: "DescriptionCell")
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "ButtonCell")
        tableView.register(PhotoDescriptionTableViewCell.self, forCellReuseIdentifier: "PhotoDescription")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
