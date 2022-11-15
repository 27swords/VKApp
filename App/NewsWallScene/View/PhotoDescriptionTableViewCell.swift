//
//  PhotoDescriptionTableViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 13.11.22.
//

import UIKit

final class PhotoDescriptionTableViewCell: UITableViewCell {

    //MARK: - Views
    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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
    func configureDescriptionPhoto(photo: NewsWall) {
        descriptionImage.image = photo.imageDescription
    }
}

//MARK: - Private Extensions
private extension PhotoDescriptionTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.926408112, green: 0.9291402698, blue: 0.9507598281, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        backgroundCell.addSubview(descriptionImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundCell.heightAnchor.constraint(equalToConstant: 500),
            
            descriptionImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor),
            descriptionImage.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor),
            descriptionImage.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor),
            descriptionImage.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor),
        ])
    }
}
