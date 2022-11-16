//
//  FriendsPhotoCell.swift
//  App
//
//  Created by Alexander Chervoncev on 9.08.22.
//

import UIKit

final class FriendsPhotoCell: UICollectionViewCell {
    
    //MARK: - Outlets
    var photoView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellPhoto(_ photo: Photo) {
        photoView.loadImage(with: "")
    }
}

//MARK: - Private Extension
private extension FriendsPhotoCell {
    func setupView() {
        contentView.addSubview(photoView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photoView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
