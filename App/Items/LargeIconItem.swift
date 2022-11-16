//
//  LargeIconItem.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit

class LargeIconItem: UITableViewCell {
    
    //MARK: - Outlets    
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackRightView: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupSubviews()
        updateColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods    
    func configureCellForFriends(_ friend: Friends) {
        firstNameLabel.text = friend.firstName + " " + friend.lastName
        lastNameLabel.text = " "
        iconImageView.loadImage(with: friend.photo100)
    }
    
    func configureCellForGroup(_ group: Group) {
        firstNameLabel.text = group.name
        lastNameLabel.text = ""
        iconImageView.loadImage(with: group.photo50)
    }
}

//MARK: - Extensions
private extension LargeIconItem {
    func updateColors() {
        firstNameLabel.textColor = UIColor.black
        lastNameLabel.textColor = UIColor.black
        contentView.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        backgroundCell.backgroundColor = .white
    }
    
    func setupSubviews() {
        contentView.addSubview(backgroundCell)
        [firstNameLabel, lastNameLabel].forEach { stackRightView.addArrangedSubview($0) }
        [iconImageView, stackRightView].forEach { backgroundCell.addSubview($0) }

        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundCell.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            iconImageView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 60.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 60.0),
            
            stackRightView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            stackRightView.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 20),
            stackRightView.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: 5)
        ])
    }
}
