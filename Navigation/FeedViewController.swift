//
//  FeedViewController.swift
//  Navigation
//
//  Created by User on 11.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    let post = PostTitle(title: "My Post")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        button.setTitle("Post Screen", for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }

        @objc func showDetails() {
            let postViewController = PostViewController()
            postViewController.stringFromPostStruct = post.title
            navigationController?.pushViewController(postViewController, animated: true)
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
