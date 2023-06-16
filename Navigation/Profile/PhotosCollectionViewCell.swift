//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by User on 18.05.2023.
//

import Foundation
import UIKit

//MARK: - Class PhotosCollectionViewCell PhotosCollectionViewCell Класс

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Class Properties Свойства Класса
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Class Initializer Инициализатор Класса
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
        addingLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Class Methods Методы Класса
    private func addingLayouts() {
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
