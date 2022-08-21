//
//  NewsFeedTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 21.08.22.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCell"
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "VKLaunchScreen")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.image = UIImage(named: "VKLaunchScreen")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "nameLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "dateLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "descriptionLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var commentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var eyeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "324"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shareLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var eyeLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var commentImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var shareImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var eyeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        updateColors()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NewsFeedTableViewCell {
    func updateColors() {
        nameLabel.textColor = UIColor.black
        dateLabel.textColor = UIColor.gray
        descriptionLabel.textColor = UIColor.black
        contentView.backgroundColor = #colorLiteral(red: 0.8265798688, green: 0.9259606004, blue: 0.8862180114, alpha: 1)
        likeView.backgroundColor = .orange
        commentView.backgroundColor = .red
        shareView.backgroundColor = .green
        eyeView.backgroundColor = .blue
    }
    
    func setupSubviews() {
        contentView.addSubview(cardView)
        
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        topView.addSubview(avatarImageView)
        
        cardView.addSubview(topView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        bottomView.addSubview(likeView)
        bottomView.addSubview(commentView)
        bottomView.addSubview(shareView)
        bottomView.addSubview(eyeView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: cardView.topAnchor),
            topView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
            topView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
            avatarImageView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 12),
            avatarImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 12),
            nameLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
            dateLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 12),
            dateLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),
            descriptionLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 12),
            descriptionLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            
            postImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            postImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 12),
            postImageView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -12),
            
            bottomView.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            bottomView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50),
            
            likeView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            likeView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 12),
            likeView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            likeView.widthAnchor.constraint(equalToConstant: 50),
            
            commentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            commentView.leftAnchor.constraint(equalTo: likeView.rightAnchor),
            commentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            commentView.widthAnchor.constraint(equalToConstant: 50),

            shareView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            shareView.leftAnchor.constraint(equalTo: commentView.rightAnchor),
            shareView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            shareView.widthAnchor.constraint(equalToConstant: 50),

            eyeView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            //eyeView.leftAnchor.constraint(equalTo: shareView.rightAnchor),
            eyeView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -12),
            eyeView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            eyeView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
