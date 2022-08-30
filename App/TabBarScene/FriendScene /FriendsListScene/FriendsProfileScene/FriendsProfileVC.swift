//
//  FriendsProfileVC.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import UIKit

class FriendsProfileVC: UIViewController {
    
    //MARK: - Inits
    private let service = PhotoService()
    var friendID: String = ""
    var storedModels: [Photo] = []
    var storedImages: [String] = []
    
    //MARK: - Outlets
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Галерея"
        setupCollectionview()
        setupConstraints()
        fetchPhoto()
    }
}

//MARK: - Extension CollectionView
extension FriendsProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.photoView.loadImage(with: storedImages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = collectionView.frame.width/4 - 1
        
        if UIDevice.current.orientation.isLandscape {
            width = collectionView.frame.width/6 - 1
        }
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoVC()
        vc.photoImages = storedImages
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PhotoVC else { return }
        vc.photoImages = storedImages
    }
}

//MARK: - Private Extensions
private extension FriendsProfileVC {
    func setupCollectionview() {
        collectionView.backgroundColor = #colorLiteral(red: 0.9256621003, green: 0.9306682944, blue: 0.9508803487, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Load Image
    func fetchPhoto() {
        Task {
            await service.loadPhoto(for: friendID) { [weak self] photos in
                self?.storedModels = photos
                if let imageLinks = self?.sortImage(type: "w", array: photos) {
                    self?.storedImages = imageLinks
                }
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func sortImage(type: String, array: [Photo]) -> [String] {
        var links: [String] = []
        
        for model in array {
            for size in model.sizes {
                if size.type == type {
                    links.append(size.url)
                }
            }
        }
        return links
    }
}
