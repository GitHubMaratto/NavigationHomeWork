//
//  PhotosViewController.swift
//  Navigation
//
//  Created by User on 17.05.2023.
//

import Foundation
import UIKit

//MARK: - class PhotosViewController

class PhotosViewController: UIViewController {
    
    // MARK: - Class Properties Свойства Класса
    
    var imagesAdding = [UIImage]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PhotosCollecrionViewCell.self, forCellWithReuseIdentifier: PhotosCollecrionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: UIScreen.main.bounds.width, height: 40))
   
    
    
    //MARK: - Class Methods Методы Класса
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBarToTheGallery()
        addingGalleryViewsPhotosViewController()
        addingLayoutsPhotosGalleryViewController()
        makeArrayImages()
    }
<<<<<<< Updated upstream
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
=======
>>>>>>> Stashed changes
    
    private func setNavigationBarToTheGallery() {
        let navigationItemAdd = UINavigationItem(title: "Photo Gallery")
        let navigationBackButton = UIBarButtonItem(title: "Back",
                                                   style: .plain,
                                                   target: self,
                                                   action: #selector(dissmissSelf))
        navigationItemAdd.leftBarButtonItem = navigationBackButton
        navigationBar.setItems([navigationItemAdd], animated: true)
    }
 
    @objc func dissmissSelf() {
<<<<<<< Updated upstream
        navigationController?.pushViewController(ProfileViewController(), animated: true)
=======
        navigationController?.popViewController(animated: true)
>>>>>>> Stashed changes
        print("tapped")
    }
  
    private func makeArrayImages() {
        for i in 0...19{
            let image = UIImage(named: "Photo\(i)")!
            imagesAdding.append(image)
        }
    }
    
    private  func addingGalleryViewsPhotosViewController() {
        view.addSubview(collectionView)
        view.addSubview(navigationBar)
    }
    
    private func addingLayoutsPhotosGalleryViewController() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


//MARK: - Class Extension UICollectionViewDataSource Расширение Класса

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesAdding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollecrionViewCell.identifier, for: indexPath) as! PhotosCollecrionViewCell

        cell.mainImageView.image = imagesAdding[indexPath.row]
        
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegate {
    
}

// MARK: - Class Extension UICollectionViewDelegateFlowLayout Расширение Класса

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var insert: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.bounds.width - 32) / 3
        
        return CGSize(width: widthCell, height: widthCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        insert
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: insert,
                     left: insert,
                     bottom: insert,
                     right: insert)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        insert
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Секция = \(indexPath.section), Ячейка = \(indexPath.item)")
    }
    
}
