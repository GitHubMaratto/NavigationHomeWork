//
//  Posts.swift
//  Navigation
//
//  Created by Marat on 11.05.2023.
//

import Foundation
import UIKit

//Создаю труктуру Post
struct Post {
    var authorPost: String
    var descriptionPost: String
    var imagePost: UIImage
    var likesPost: Int
    var viewsPost: Int
    var isLike: Bool = false
    
    static func makePosts() -> [[Post]] {
        
        //Создаю массив со значениями Post
        var postWithSections = [[Post]]()
        var sectionInPost = [Post]()
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Avzalov Marat",
                                  descriptionPost: "This is my Post",
                                  imagePost: UIImage(named: "Photo")!,
                                  likesPost: 650,
                                  viewsPost: 1000))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "MDK",
                                  descriptionPost: "This cat is Cool for You today",
                                  imagePost: UIImage(named: "MDKPost")!,
                                  likesPost: 1298,
                                  viewsPost: 100120031))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Travel",
                                  descriptionPost: "Nice Weather Nice Shine",
                                  imagePost: UIImage(named: "NicePost")!,
                                  likesPost: 1231,
                                  viewsPost: 14134532752))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Post with Love",
                                  descriptionPost: "Love is...",
                                  imagePost: UIImage(named: "LoveIsPost")!,
                                  likesPost: 4325,
                                  viewsPost: 412456545))
        
        for _ in 0...5 {
            postWithSections.append(sectionInPost)
        }
        return postWithSections
        }
    
    
    static func makePostsWithArray() -> [Post] {
        
        //Создаю массив со значениями Post
        var sectionInPost = [Post]()
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Avzalov Marat",
                                  descriptionPost: "This is my Post",
                                  imagePost: UIImage(named: "Photo")!,
                                  likesPost: 650,
                                  viewsPost: 1000))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "MDK",
                                  descriptionPost: "This cat is Cool for You today",
                                  imagePost: UIImage(named: "MDKPost")!,
                                  likesPost: 1298,
                                  viewsPost: 100120031))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Travel",
                                  descriptionPost: "Nice Weather Nice Shine",
                                  imagePost: UIImage(named: "NicePost")!,
                                  likesPost: 1231,
                                  viewsPost: 14134532752))
        //Добавляю в массив структуру Post
        sectionInPost.append(Post(authorPost: "Post with Love",
                                  descriptionPost: "Love is...",
                                  imagePost: UIImage(named: "LoveIsPost")!,
                                  likesPost: 4325,
                                  viewsPost: 412456545))
        return sectionInPost
        }

}
