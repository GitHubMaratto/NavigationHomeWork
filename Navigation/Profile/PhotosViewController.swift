//
//  PhotosViewController.swift
//  Navigation
//
//  Created by User on 17.05.2023.
//

import Foundation
import UIKit

//MARK: - Class PhotosViewController PhotosViewController Класс

class PhotosViewController: UIViewController {
    
    // MARK: - Class Properties Свойства Класса
    
    let photosCollectionViewCell = PhotosCollectionViewCell()
    lazy var photo = photosCollectionViewCell.mainImageView
    
    var imagesAdding = [UIImage]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: UIScreen.main.bounds.width, height: 40))
    
    //Создаю backView задник для отображения аватара на весь экран
    private let backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backView.alpha = 0
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    //closeButton кнопка для закрытия вью
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.alpha = 0
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTap)))
        closeButton.isUserInteractionEnabled = true
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return closeButton
    }()
    
    
    //MARK: - Class Methods Методы Класса
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBarToTheGallery()
        addingGalleryViewsPhotosViewController()
        addingLayoutsPhotosGalleryViewController()
        makeArrayImages()
        photoCustomize()

        self.navigationController?.isNavigationBarHidden = true
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
    
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
        navigationController?.popViewController(animated: true)
//        navigationController?.pushViewController(ProfileViewController(), animated: true)
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
        view.addSubview(photo)
        view.addSubview(backView)
        view.addSubview(closeButton)
        
    }
    
    private func addingLayoutsPhotosGalleryViewController() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //backView констрейнты
            backView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

            //closeButton конестрейнты
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func photoCustomize() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.isUserInteractionEnabled = true
    }
  
    //Метод imageTapped() при нажатии на картинку увеливчивает его на весь экран
    @objc private func imageTapped() {
        print("Image Tapped")
        UIView.animate(withDuration: 0.5, animations: {
            self.photo.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.backView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            self.photo.center = self.backView.center
            self.photo.layer.cornerRadius = 0
            self.backView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
                self.backView.alpha = 1
            }
        }
    }
    
    //Метод closeButtonTap() метод сворачивает обратно аватар
    @objc private func closeButtonTap() {
        
        print("Tapped closeButton")
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.photo.transform = CGAffineTransform(scaleX: 0, y: 0)
                self.photo.transform = .init(scaleX: 0, y: 0)
                self.photo.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
                self.backView.alpha = 0
            })

        }
        photo.image = nil
    }
}


//MARK: - Class Extension UICollectionViewDataSource Расширение Класса

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesAdding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell

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
        photo.image = UIImage(named: "Photo\(indexPath.item)")
        
        
        imageTapped()
    }
    
}
