import Foundation
import UIKit

class LogInViewController: UIViewController {

    //Создаю scrollView
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()

    //Создаю contentView
    private let  contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    //Иконка лого imageLogoVK
    let imageLogoVK: UIImageView = {
        let logoVK = UIImageView()
        logoVK.image = UIImage(named: "LogoVK")
        logoVK.backgroundColor = .white
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        return logoVK
    }()
    //Окно поле ввода логина loginTextField
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.tintColor = UIColor.appColor(.myColor)
        loginTextField.autocapitalizationType = .none
        loginTextField.placeholder = "Email of phone"
        loginTextField.backgroundColor = .systemGray6
        loginTextField.addPaddingView()

        return loginTextField
    }()
    
    //Окно поле ввода логина loginTextField
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.tintColor = UIColor.appColor(.myColor)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addPaddingView()
        
        return passwordTextField
    }()
    
    //Кнопка логина Log In
    let buttonLogIn: UIButton = {
        let buttonLogIn = UIButton()
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        buttonLogIn.setTitle("Log In", for: .normal)
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.setBackgroundImage(UIImage.init(named: "Blue_pixel"), for: .normal)
        buttonLogIn.layer.cornerRadius = 10
        buttonLogIn.addTarget(self, action: #selector(buttonLigInPressed), for: .touchUpInside)
        
        return buttonLogIn
    }()
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.isHidden = true
        
        //Меняю цвет основного view
        view?.backgroundColor = .white
                
        addingSubviews()
        addingConstraints()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    //Метод добавления Views на экран
    func addingSubviews() {
        view.addSubview(scrollView)
        view.addSubview(contentView)
        contentView.addSubview(imageLogoVK)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(buttonLogIn)
    }
    
    //Метод добавления Constraints на экран
    func addingConstraints() {
        
        //Auto layout для imageLogoVK выравниваю на середину
        let constraintImageLogoVKCenter = NSLayoutConstraint(item: imageLogoVK, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([constraintImageLogoVKCenter])
        
        //Выставляю Constrain
        NSLayoutConstraint.activate([
            
            //Auto layout для scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //Auto layout для scrollView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            //Auto layout для imageLogoVK
            imageLogoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageLogoVK.widthAnchor.constraint(equalToConstant: 100),
            imageLogoVK.heightAnchor.constraint(equalToConstant: 100),

            //Auto layout для loginTextField
            loginTextField.topAnchor.constraint(equalTo: imageLogoVK.bottomAnchor, constant: 120),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Auto layout для passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //Auto layout для buttonLogIn
            buttonLogIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    //Метод кнопки логина Log In
    @objc func buttonLigInPressed() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }

}
//Расширяю LogInViewController для кнопки ретурн на клавиатуре что бы скрыть клавиатуру для ввода
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

//Расширяю UITextField и добавляю метод отступа
extension UITextField {
    func addPaddingView(){
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
