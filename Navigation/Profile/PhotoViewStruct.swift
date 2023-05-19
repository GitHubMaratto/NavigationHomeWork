//
//  PhotoViewStruct.swift
//  Navigation
//
//  Created by User on 17.05.2023.
//

import Foundation
import UIKit


 //MARK: - Struct PhotoViewStruct структура PhotoViewStruct

struct PhotoViewStruct {
    var photoText: String
    var photoGalleryFirst: UIImage
    var photoGallerySecond: UIImage
    var photoGalleryThird: UIImage
    var photoGalleryFourth: UIImage
    var arrowRightImage: UIImage
    
    static func makeGallery() -> [PhotoViewStruct] {
        
        var photoViewStruct = [PhotoViewStruct]()
        
        photoViewStruct.append(PhotoViewStruct(photoText: "Photos",
                                               photoGalleryFirst: UIImage(named: "Photo0")!,
                                               photoGallerySecond: UIImage(named: "Photo1")!,
                                               photoGalleryThird: UIImage(named: "Photo2")!,
                                               photoGalleryFourth: UIImage(named: "Photo3")!,
                                               arrowRightImage: UIImage(systemName: "arrow.right")!))
        
        return photoViewStruct
        
    }
}
