//
//  CustomTableView.swift
//  Navigation
//
//  Created by Marat on 11.05.2023.
//

import Foundation
import UIKit


final class CustomTableViewCell: UITableViewCell {
    
    //Создаю contentWhiteView
    private let contentWhiteView: UIView = {
        let contentWhiteView = UIView()
        contentWhiteView.backgroundColor = .white
        contentWhiteView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentWhiteView
    }()
    
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
    private let likesView: UILabel = {
        let likesView = UILabel()
        likesView.translatesAutoresizingMaskIntoConstraints = false
        likesView.font = UIFont.systemFont(ofSize: 16)
        likesView.textColor = .black
        
        return likesView
    }()
    
    //Создаю viewViews
    private let viewViews: UILabel = {
        let viewViews = UILabel()
        viewViews.translatesAutoresizingMaskIntoConstraints = false
        viewViews.font = UIFont.systemFont(ofSize: 16)
        viewViews.textColor = .black
        
        return viewViews
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingViewsFromeCustomTableView()
        addingConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    }
    
    //Метод добавляет все наши view на экран
    private func addingViewsFromeCustomTableView() {
        [contentWhiteView, authorTextLabel, imagePostView, descriptionTextLabel, likesView, viewViews].forEach {
            contentView.addSubview($0)
        }
    }
    
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
            likesView.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor),
            
            //Констрейнты для viewViews
            viewViews.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            
            viewViews.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -16),
            viewViews.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor),
        ])
    }
    
    
}
