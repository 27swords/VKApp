//
//  NamePublicTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 12.11.22.
//

import UIKit

final class NamePublicTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var namePublicLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "Helvetica- Bold", size: 18.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "Helvetica-Light", size: 13.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
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
        avatarImage.makeRounded()
        self.contentView.layoutIfNeeded()
    }
    
    //MARK: - Methods
    func configureHeaderCell(header: NewsWall) {
        avatarImage.image = header.avatarImage
        namePublicLabel.text = header.name
        dateLabel.text = header.date
    }
}

//MARK: - Private Extensions
private extension NamePublicTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.926408112, green: 0.9291402698, blue: 0.9507598281, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        
        backgroundCell.addSubview(avatarImage)
        backgroundCell.addSubview(topStackView)
        
        topStackView.addArrangedSubview(namePublicLabel)
        topStackView.addArrangedSubview(dateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundCell.heightAnchor.constraint(equalToConstant: 60),
            
            avatarImage.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            avatarImage.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 10),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            
            topStackView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            topStackView.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10)
        ])
    }
}
