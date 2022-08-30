//
//  PhotoCollectionViewCell.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    var photoView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photoView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
   
     
    }
}
