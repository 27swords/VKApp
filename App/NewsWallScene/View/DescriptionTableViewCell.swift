//
//  DescriptionTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 12.11.22.
//

import UIKit

final class DescriptionTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Helvetica", size: 16.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupColors()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        
        self.contentView.layoutIfNeeded()
    }
    
    //MARK: - Methods
    func configureTextDescription(text: NewsWall) {
        descriptionLabel.text = text.description
    }
}

//MARK: - Private Extension
private extension DescriptionTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.926408112, green: 0.9291402698, blue: 0.9507598281, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        
        backgroundCell.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
//            backgroundCell.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 10),
            descriptionLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -10),
            
        ])
    }
}
