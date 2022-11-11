//
//  NewsWallTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 11.11.22.
//

import UIKit

final class NewsWallTableViewCell: UITableViewCell {
    
    //MARK: - Views
    // View для содержимого новости
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 12
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
        view.text = "Name Public"
        view.textColor = .black
        view.font = UIFont(name: "Helvetica- Bold", size: 16.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.text = "два часа назад"
        view.textColor = .black
        view.font = UIFont(name: "Helvetica-Light", size: 13.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "wjeht dksjghdkjsh g j s h d g d  k jshgksdjghskdjghkjbskjdnbkdsjngkjsdgskjhvkdjhv"
        view.numberOfLines = 0
        view.font = UIFont(name: "Helvetica", size: 15.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "VKLaunchScreen")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //View для взаимодействия с новостью
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "UnLike"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var commentButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "Comment"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "Share"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - LifeCicle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupColors()
        setupViews()
        setupConsraints()
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
}

private extension NewsWallTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.926408112, green: 0.9291402698, blue: 0.9507598281, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        
        backgroundCell.addSubview(avatarImage)
        backgroundCell.addSubview(topStackView)
        backgroundCell.addSubview(descriptionLabel)
        backgroundCell.addSubview(descriptionImage)
        backgroundCell.addSubview(buttonView)
        
        buttonView.addSubview(bottomStackView)

        topStackView.addArrangedSubview(namePublicLabel)
        topStackView.addArrangedSubview(dateLabel)
        
        bottomStackView.addArrangedSubview(likeButton)
        bottomStackView.addArrangedSubview(commentButton)
        bottomStackView.addArrangedSubview(shareButton)
    }
    
    func setupConsraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            backgroundCell.heightAnchor.constraint(equalToConstant: 500),
            
            avatarImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            avatarImage.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 5),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            
            topStackView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            topStackView.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 10),
            descriptionLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -10),
            
            descriptionImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionImage.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor),
            descriptionImage.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor),
            
            
            buttonView.topAnchor.constraint(equalTo: descriptionImage.bottomAnchor, constant: 10),
            buttonView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor),
            buttonView.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor),
            buttonView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor),
            
            buttonView.heightAnchor.constraint(equalToConstant: 35),
            
            bottomStackView.topAnchor.constraint(equalTo: buttonView.topAnchor),
            bottomStackView.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 20),
            bottomStackView.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor),
        ])
    }
}
