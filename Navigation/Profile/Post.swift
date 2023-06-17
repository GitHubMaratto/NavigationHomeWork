//
//  Posts.swift
//  Navigation
//
//  Created by Marat on 11.05.2023.
//

import Foundation
import UIKit

//MARK: - Struck Post Структура Post

//Создаю труктуру Post
struct Post {
    var authorPost: String
    var descriptionPost: String
    var imagePost: UIImage
    var likesPost: Int
    var viewsPost: Int
    var isLike: Bool = false
}
