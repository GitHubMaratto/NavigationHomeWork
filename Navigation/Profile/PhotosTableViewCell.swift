//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by User on 17.05.2023.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Class Properties Свойства Класса
    
    let firstPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.clipsToBounds = true
        firstPhoto.contentMode = .scaleAspectFill
        
        return firstPhoto
    }()
    
    let secondPhoto: UIImageView = {
        let secondPhoto = UIImageView()
        secondPhoto.translatesAutoresizingMaskIntoConstraints = false
        secondPhoto.layer.cornerRadius = 6
        secondPhoto.clipsToBounds = true
        secondPhoto.contentMode = .scaleAspectFill
        
        return secondPhoto
    }()
    
    let thirdPhoto: UIImageView = {
        let thirdPhoto = UIImageView()
        thirdPhoto.translatesAutoresizingMaskIntoConstraints = false
        thirdPhoto.layer.cornerRadius = 6
        thirdPhoto.clipsToBounds = true
        thirdPhoto.contentMode = .scaleToFill
        
        return thirdPhoto
    }()
    
    let fourthPhoto: UIImageView = {
        let fourthPhoto = UIImageView()
        fourthPhoto.translatesAutoresizingMaskIntoConstraints = false
        fourthPhoto.layer.cornerRadius = 6
        fourthPhoto.clipsToBounds = true
        fourthPhoto.contentMode = .scaleToFill
        
        return fourthPhoto
    }()
    
    let photosTextLabel: UILabel = {
        let photosTextLabel = UILabel()
        photosTextLabel.textColor = .black
        photosTextLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosTextLabel.translatesAutoresizingMaskIntoConstraints = false
        photosTextLabel.numberOfLines = 2
        
        return photosTextLabel
    }()
    
    let imageArrow: UIImageView = {
        let imageArrow = UIImageView()
        imageArrow.translatesAutoresizingMaskIntoConstraints = false
        
        return imageArrow
    }()
    
    //MARK: - Class Initalizer Инициализатор Класса
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingViewsOnScreen()
        addingLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Class Methods Методы Класса
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photosTextLabel.text = nil
        firstPhoto.image = nil
        secondPhoto.image = nil
        thirdPhoto.image = nil
        fourthPhoto.image = nil
        imageArrow.image = nil
       
    }
    
    func setupCellGallery(insertCellPhotos: PhotoViewStruct) {
        photosTextLabel.text = insertCellPhotos.photoText
        firstPhoto.image = insertCellPhotos.photoGalleryFirst
        secondPhoto.image = insertCellPhotos.photoGallerySecond
        thirdPhoto.image = insertCellPhotos.photoGalleryThird
        fourthPhoto.image = insertCellPhotos.photoGalleryFourth
        imageArrow.image = insertCellPhotos.arrowRightImage
    }
    
    private func addingViewsOnScreen() {
        addSubview(photosTextLabel)
        addSubview(firstPhoto)
        addSubview(secondPhoto)
        addSubview(thirdPhoto)
        addSubview(fourthPhoto)
        addSubview(imageArrow)
    }
    
    private func addingLayouts() {
        NSLayoutConstraint.activate([
            photosTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photosTextLabel.heightAnchor.constraint(equalToConstant: 24),
            
            firstPhoto.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: 12),
            firstPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            firstPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            firstPhoto.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            firstPhoto.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 48) / 4),
            
            secondPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            secondPhoto.leadingAnchor.constraint(equalTo: firstPhoto.trailingAnchor, constant: 8),
            secondPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            secondPhoto.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            secondPhoto.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 48) / 4),
            
            thirdPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            thirdPhoto.leadingAnchor.constraint(equalTo: secondPhoto.trailingAnchor, constant: 8),
            thirdPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            thirdPhoto.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            thirdPhoto.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 48) / 4),
            
            fourthPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            fourthPhoto.leadingAnchor.constraint(equalTo: thirdPhoto.trailingAnchor, constant: 8),
            fourthPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            fourthPhoto.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            fourthPhoto.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 48) / 4),
            
            imageArrow.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageArrow.widthAnchor.constraint(equalToConstant: 24),
            imageArrow.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
}
