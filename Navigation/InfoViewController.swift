//
//  InfoViewController.swift
//  Navigation
//
//  Created by User on 11.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemCyan
        title = "Info Screen"
        
        
        
        let buttonPress = UIButton(type: .system)
        buttonPress.isUserInteractionEnabled = true
        buttonPress.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        buttonPress.setTitle("Show Alert", for: .normal)
        buttonPress.backgroundColor = .white
        view.addSubview(buttonPress)
        buttonPress.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func showAlert() {
        let showAlert = AlertViewController(title: "Title", message: "message", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in print("Tap Yes")})
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in print("Tap No")})
        
        showAlert.addAction(yesAction)
        showAlert.addAction(noAction)
        present(showAlert, animated: true)
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
