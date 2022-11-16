//
//  ButtonTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 12.11.22.
//

import UIKit

final class ButtonTableViewCell: UITableViewCell {
    
    //MARK: - Views
    private lazy var backgroundCell: UIView = {
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
    
    //MARK: - Life Cycle
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
    func configureLikes(likeCount: NewsWall) {
        
    }
}

//MARK: - Private Extensions
private extension ButtonTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.926408112, green: 0.9291402698, blue: 0.9507598281, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)

        backgroundCell.addSubview(bottomStackView)

        bottomStackView.addArrangedSubview(likeButton)
        bottomStackView.addArrangedSubview(commentButton)
        bottomStackView.addArrangedSubview(shareButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

            backgroundCell.heightAnchor.constraint(equalToConstant: 45),

            bottomStackView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            bottomStackView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20)
        ])
    }
}

