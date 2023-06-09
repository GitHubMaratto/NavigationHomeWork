//
//  PostPresentDetailVC.swift
//  Navigation
//
//  Created by Marat on 01.06.2023.
//

import Foundation
import UIKit


class PostPresentDetailVC: UIViewController {

    //MARK: - Class Properties Свойства Класса
    
    //Создаю authorTextLabel
    private let authorTextLabel: UILabel = {
        let authorTextLabel = UILabel()
        authorTextLabel.translatesAutoresizingMaskIntoConstraints = false
        authorTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorTextLabel.textColor = UIColor.black
        authorTextLabel.numberOfLines = 2
        
        return authorTextLabel
    }()
    
    //Создаю imagePostView
    private let imagePostView: UIImageView = {
        let imagePostView = UIImageView()
        imagePostView.translatesAutoresizingMaskIntoConstraints = false
        imagePostView.contentMode = .scaleAspectFit
        imagePostView.backgroundColor = .black
        
        return imagePostView
    }()
    
    //Создаю descriptionTextLabel
    private let descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel()
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionTextLabel.textColor = .systemGray
        descriptionTextLabel.numberOfLines = 0
        
        return descriptionTextLabel
    }()
    
    //Создаю likesView
    private lazy var likesView: UILabel = {
        let likesView = UILabel()
        likesView.translatesAutoresizingMaskIntoConstraints = false
        likesView.font = UIFont.systemFont(ofSize: 16)
        likesView.textColor = .black
        
        return likesView
    }()
    
    //Создаю viewViews
    private lazy var viewViews: UILabel = {
        let viewViews = UILabel()
        viewViews.translatesAutoresizingMaskIntoConstraints = false
        viewViews.font = UIFont.systemFont(ofSize: 16)
        viewViews.textColor = .black
        
        return viewViews
    }()

    //MARK: - Class Methods Методы Класса
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addingViewsOnScreenPresent()
        addingLayouts()
    }
    
    //Метод заполнения ячеек
    func setupVC(insertPost: Post, indexPath: IndexPath) {
        authorTextLabel.text =  insertPost.authorPost
        imagePostView.image = insertPost.imagePost
        descriptionTextLabel.text = insertPost.descriptionPost
        likesView.text = "Likes: \(String(insertPost.likesPost))"
        viewViews.text = "Views: \(String(insertPost.viewsPost))"
    }
    
    //Метод добавляет все наши view на экран
    private func addingViewsOnScreenPresent() {
        [authorTextLabel, imagePostView, descriptionTextLabel, likesView, viewViews].forEach {
            view.addSubview($0)
        }
    }
    
    private func addingLayouts() {
        NSLayoutConstraint.activate([
            //Констрейнты для authorTextLabel
            authorTextLabel.topAnchor.constraint(equalTo: view.topAnchor),
            authorTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            authorTextLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //Констрейнты для imagePostView
            imagePostView.topAnchor.constraint(equalTo: authorTextLabel.bottomAnchor),
            imagePostView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalToConstant: 250),
            
            //Констрейнты для descriptionTextLabel
            descriptionTextLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 30),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTextLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //Констрейнты для likesView
            likesView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            likesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likesView.widthAnchor.constraint(equalToConstant: 150),
            
            //Констрейнты для viewViews
            viewViews.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            
            viewViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
  
    
    
}
