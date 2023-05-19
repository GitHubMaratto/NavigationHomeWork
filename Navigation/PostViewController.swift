//
//  PostViewController.swift
//  Navigation
//
//  Created by User on 11.04.2023.
//

import UIKit

class PostViewController: UIViewController {
   
    var stringFromPostStruct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemYellow
        let titlePost = stringFromPostStruct
        title = titlePost

        
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        button.setTitle("Info Screen", for: .normal)
        button.backgroundColor = .white
        view.addSubview(button)
        button.addTarget(self, action: #selector(showInfo), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
        
    @objc func showInfo() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
