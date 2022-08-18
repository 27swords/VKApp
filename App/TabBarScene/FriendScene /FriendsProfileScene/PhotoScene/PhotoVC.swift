//
//  PhotoVC.swift
//  App
//
//  Created by Alexander Chervoncev on 9.08.22.
//
import UIKit

class PhotoVC: UIViewController {
    
    //MARK: - Inits
    private let service = PhotoService()
    private var likesCount = 0
    var photoID: String = ""
    var photoModels: [Photo] = []
    var photoImages: [String] = []
    
    
    //MARK: - Outlets
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let likeView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.06442873475, green: 0.06442873475, blue: 0.06442873475, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "UnLike"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeCounterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionview()
        setupConstraints()
        fetchPhoto()
    }
}

//MARK: - Extension CollctionView
extension PhotoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Objc methods
    @objc func backtapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }
    
    //MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCell
        else {
            return UICollectionViewCell()
        }
        cell.photoView.loadImage(with: photoImages[indexPath.item])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

//MARK: - Private Extension
private extension PhotoVC {
    func setupCollectionview() {
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "Cell")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backtapped(sender:)))
        navigationItem.leftBarButtonItem?.tintColor = .gray
        view.addSubview(collectionView)
        view.addSubview(likeView)
        likeView.addSubview(likeButton)
        likeView.addSubview(likeCounterLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            likeView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            likeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            likeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            likeView.heightAnchor.constraint(equalToConstant: 50),
            
            likeButton.centerXAnchor.constraint(equalTo: likeView.centerXAnchor),
            likeButton.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            
            likeCounterLabel.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: -10),
            likeCounterLabel.rightAnchor.constraint(equalTo: likeView.rightAnchor),
            likeCounterLabel.topAnchor.constraint(equalTo: likeView.topAnchor),
            likeCounterLabel.bottomAnchor.constraint(equalTo: likeView.bottomAnchor),
            likeCounterLabel.widthAnchor.constraint(equalToConstant: 50),
            likeCounterLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

    //MARK: - Load Image
    func fetchPhoto() {
        Task {
            await service.loadPhoto(for: photoID) { [weak self] photos in
                self?.photoModels = photos
                if let imageLinks = self?.sortImage(type: "x", array: photos) {
                    self?.photoImages = imageLinks
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

