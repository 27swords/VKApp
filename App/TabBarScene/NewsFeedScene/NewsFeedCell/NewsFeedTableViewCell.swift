//
//  NewsFeedTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 21.08.22.
//

import UIKit

final class NewsFeedTableViewCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCell"
    
    //MARK: - Outlets
    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "VKLaunchScreen")
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
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "nameLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = label.font.withSize(14)
        label.text = "dateLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = label.font.withSize(16)
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
        label.text = "0"
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shareLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var eyeLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "UnLike")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var commentImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Comment")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var shareImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Share")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var eyeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Eye")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        updateColors()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private Extension
private extension NewsFeedTableViewCell {
    //MARK: - Func updateColors
    func updateColors() {
       //TopViews
        nameLabel.textColor = UIColor.black
        dateLabel.textColor = UIColor.gray
        
        //Views
        contentView.backgroundColor = #colorLiteral(red: 0.8265798688, green: 0.9259606004, blue: 0.8862180114, alpha: 1)
        cardView.backgroundColor = .white
        topView.backgroundColor = .white
        descriptionLabel.textColor = UIColor.black
        bottomView.backgroundColor = .white
        
        //BottomViews
        likeView.backgroundColor = .white
        shareView.backgroundColor = .white
        eyeView.backgroundColor = .white
        commentView.backgroundColor = .white
        
        //BottoViews
        likeLabel.textColor = UIColor.gray
        commentLabel.textColor = UIColor.gray
        shareLabel.textColor = UIColor.gray
        eyeLabel.textColor = UIColor.gray
    }
    
    //MARK: - Func setupSubviews
    func setupSubviews() {
        contentView.addSubview(cardView)
        
        cardView.addSubview(topView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        topView.addSubview(avatarImageView)
        
        bottomView.addSubview(likeView)
        bottomView.addSubview(commentView)
        bottomView.addSubview(shareView)
        bottomView.addSubview(eyeView)
        
        likeView.addSubview(likeImageView)
        likeView.addSubview(likeLabel)
        
        commentView.addSubview(commentImageView)
        commentView.addSubview(commentLabel)
        
        shareView.addSubview(shareImageView)
        shareView.addSubview(shareLabel)
        
        eyeView.addSubview(eyeImageView)
        eyeView.addSubview(eyeLabel)
        
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
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
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -20),
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
            bottomView.heightAnchor.constraint(equalToConstant: 40),
            
            likeView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            likeView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 12),
            likeView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            likeView.widthAnchor.constraint(equalToConstant: 70),
            
            commentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            commentView.leftAnchor.constraint(equalTo: likeView.rightAnchor, constant: 5),
            commentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            commentView.widthAnchor.constraint(equalToConstant: 70),

            shareView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            shareView.leftAnchor.constraint(equalTo: commentView.rightAnchor, constant: 5),
            shareView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            shareView.widthAnchor.constraint(equalToConstant: 70),

            eyeView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            eyeView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -6),
            eyeView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            eyeView.widthAnchor.constraint(equalToConstant: 85),
            
            likeImageView.topAnchor.constraint(equalTo: likeView.topAnchor),
            likeImageView.leftAnchor.constraint(equalTo: likeView.leftAnchor, constant: 5),
            likeImageView.bottomAnchor.constraint(equalTo: likeView.bottomAnchor),
            likeImageView.heightAnchor.constraint(equalToConstant: 20),
            likeImageView.widthAnchor.constraint(equalToConstant: 20),
            
            likeLabel.topAnchor.constraint(equalTo: likeView.topAnchor),
            likeLabel.leftAnchor.constraint(equalTo: likeImageView.rightAnchor, constant: 5),
            likeLabel.rightAnchor.constraint(equalTo: likeView.rightAnchor),
            likeLabel.bottomAnchor.constraint(equalTo: likeView.bottomAnchor),
            
            commentImageView.topAnchor.constraint(equalTo: commentView.topAnchor),
            commentImageView.leftAnchor.constraint(equalTo: commentView.leftAnchor, constant: 5),
            commentImageView.bottomAnchor.constraint(equalTo: commentView.bottomAnchor),
            commentImageView.heightAnchor.constraint(equalToConstant: 20),
            commentImageView.widthAnchor.constraint(equalToConstant: 20),
            
            commentLabel.topAnchor.constraint(equalTo: commentView.topAnchor),
            commentLabel.leftAnchor.constraint(equalTo: commentImageView.rightAnchor, constant: 5),
            commentLabel.rightAnchor.constraint(equalTo: commentView.rightAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor),
            
            shareImageView.topAnchor.constraint(equalTo: shareView.topAnchor),
            shareImageView.leftAnchor.constraint(equalTo: shareView.leftAnchor, constant: 5),
            shareImageView.bottomAnchor.constraint(equalTo: shareView.bottomAnchor),
            shareImageView.heightAnchor.constraint(equalToConstant: 20),
            shareImageView.widthAnchor.constraint(equalToConstant: 20),
            
            shareLabel.topAnchor.constraint(equalTo: shareView.topAnchor),
            shareLabel.leftAnchor.constraint(equalTo: shareImageView.rightAnchor, constant: 5),
            shareLabel.rightAnchor.constraint(equalTo: shareView.rightAnchor),
            shareLabel.bottomAnchor.constraint(equalTo: shareView.bottomAnchor),

            eyeImageView.topAnchor.constraint(equalTo: eyeView.topAnchor),
            eyeImageView.leftAnchor.constraint(equalTo: eyeView.leftAnchor, constant: 10),
            eyeImageView.bottomAnchor.constraint(equalTo: eyeView.bottomAnchor),
            eyeImageView.heightAnchor.constraint(equalToConstant: 20),
            eyeImageView.widthAnchor.constraint(equalToConstant: 20),
            
            eyeLabel.topAnchor.constraint(equalTo: eyeView.topAnchor),
            eyeLabel.leftAnchor.constraint(equalTo: eyeImageView.rightAnchor, constant: 5),
            eyeLabel.rightAnchor.constraint(equalTo: eyeView.rightAnchor),
            eyeLabel.bottomAnchor.constraint(equalTo: eyeView.bottomAnchor),
        ])
    }
}
