//
//  CustomTableView.swift
//  Navigation
//
//  Created by Marat on 11.05.2023.
//

//import Foundation
import UIKit


final class CustomTableViewCell: UITableViewCell {
   
    
    
    
    
    //MARK: - Class Properties Свойства Класса
    
    //Пустое замыкание
    var tapLikes: (() -> Void)? = nil
    
    //Создаю contentWhiteView
    let contentWhiteView: UIView = {
        let contentWhiteView = UIView()
        contentWhiteView.backgroundColor = .white
        contentWhiteView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentWhiteView
    }()
    
    //Создаю authorTextLabel
    let authorTextLabel: UILabel = {
        let authorTextLabel = UILabel()
        authorTextLabel.translatesAutoresizingMaskIntoConstraints = false
        authorTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorTextLabel.textColor = UIColor.black
        authorTextLabel.numberOfLines = 2
        
        return authorTextLabel
    }()
    
    //Создаю imagePostView
    let imagePostView: UIImageView = {
        let imagePostView = UIImageView()
        imagePostView.translatesAutoresizingMaskIntoConstraints = false
        imagePostView.contentMode = .scaleAspectFit
        imagePostView.backgroundColor = .black
        
        return imagePostView
    }()
    
    //Создаю descriptionTextLabel
    let descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel()
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionTextLabel.textColor = .systemGray
        descriptionTextLabel.numberOfLines = 0
        
        return descriptionTextLabel
    }()
    
    //Создаю likesView
    lazy var likesView: UILabel = {
        let likesView = UILabel()
        likesView.translatesAutoresizingMaskIntoConstraints = false
        likesView.font = UIFont.systemFont(ofSize: 16)
        likesView.textColor = .black
        likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped)))
        likesView.isUserInteractionEnabled = true
        
        return likesView
    }()
    
    
    //Создаю viewViews
    let viewViews: UILabel = {
        let viewViews = UILabel()
        viewViews.translatesAutoresizingMaskIntoConstraints = false
        viewViews.font = UIFont.systemFont(ofSize: 16)
        viewViews.textColor = .black
        
        return viewViews
    }()
    
    let profileViewController = ProfileViewController()
    lazy var postsArrays = profileViewController.postsArray
    
    
    //MARK: -  Class Initializer Инициализатор Класса
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingViewsFromeCustomTableView()
        addingConstraints()
//        addLike()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -  Class Methods Методы Класса
    
    //Метод для сбрасывания значения во view
    override func prepareForReuse() {
        super.prepareForReuse()
        authorTextLabel.text = nil
        imagePostView.image = nil
        descriptionTextLabel.text = nil
        likesView.text = nil
        viewViews.text = nil
    }
    
    //Метод заполнения ячеек
    func setupCell(insertPost: Post) {
        authorTextLabel.text =  insertPost.authorPost
        imagePostView.image = insertPost.imagePost
        descriptionTextLabel.text = insertPost.descriptionPost
        likesView.text = "Likes: \(String(insertPost.likesPost))"
        viewViews.text = "Views: \(String(insertPost.viewsPost))"
//        self.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLikes)))
        likesView.isUserInteractionEnabled = true
        
    }
    
    //Метод добавляет все наши view на экран
    private func addingViewsFromeCustomTableView() {
        [contentWhiteView, authorTextLabel, imagePostView, descriptionTextLabel, likesView, viewViews].forEach {
            contentView.addSubview($0)
        }
    }
    
//    func addLikes(post: Post) {
//        post.likesPost + 1
//    }
//
    
    @objc func labelTapped() {
        if let action = self.tapLikes { action() }
//        print("Hello World!")
    }
    
    
//    func addLike() {
//        let tapGuaster = UITapGestureRecognizer()
//        likesView.addGestureRecognizer(tapGuaster)
//        tapGuaster.addTarget(self, action: #selector(labelTapped))
//    }

//    @objc func tapMyLikes() {
////        if let action = self.tapLikes { action() }
//        let profileViewController = ProfileViewController()
//        profileViewController.postNumberOne.likesPost += 1
//        print("Hello World!")
//    }
    
    private func addingConstraints() {
        NSLayoutConstraint.activate([
            //Констрейнты для contentWhiteView
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //Констрейнты для authorTextLabel
            authorTextLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor),
            authorTextLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            authorTextLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            authorTextLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //Констрейнты для imagePostView
            imagePostView.topAnchor.constraint(equalTo: authorTextLabel.bottomAnchor),
            imagePostView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalToConstant: 250),
            
            //Констрейнты для descriptionTextLabel
            descriptionTextLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor),
            
            //Констрейнты для likesView
            likesView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            likesView.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: 16),
            likesView.widthAnchor.constraint(equalToConstant: 150),
            likesView.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16),
            
            //Констрейнты для viewViews
            viewViews.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            
            viewViews.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            viewViews.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -16),
        ])
    }
    
    
}
