import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    //MARK: - Class Properties Свойтсва Класса
    
    var profileHeaderViewConstraints = UIView()
    let viewController = UIViewController()
    var profileViewController = ProfileViewController()
    
    //Создаю blueView
    let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = UIColor.appColor(.myColor)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }()
    //Создаю avatarImageView аватар с котом
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catwhite.jpg")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTap)))
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    //Создаю backView задник для отображения аватара на весь экран
    private let backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backView.alpha = 0
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    //closeButton кнопка для закрытия вью
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.alpha = 0
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTap)))
        closeButton.isUserInteractionEnabled = true
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        return closeButton
    }()
    //Создаю fullNameLabel тут написан никнейм
    let fullNameLabel: UILabel = {
        let labelTextBlack = UILabel()
        labelTextBlack.text = "Meow White"
        labelTextBlack.font =  UIFont.systemFont(ofSize: 18, weight: .bold)
        labelTextBlack.textColor = .black
        labelTextBlack.translatesAutoresizingMaskIntoConstraints = false
        
        return labelTextBlack
    }()
    //Создаю statusLabel отображение статуса
    var statusLabel: UILabel = {
        var labelStatusGray = UILabel()
        labelStatusGray.text = "Waiting for something..."
        labelStatusGray.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelStatusGray.textColor = .gray
        labelStatusGray.translatesAutoresizingMaskIntoConstraints = false
        
        return labelStatusGray
    }()
    //Создаю statusTextField текстфилд для ввода текста
    let statusTextField: UITextField = {
        let textFieldCreate = UITextField()
        textFieldCreate.placeholder = "Enter your status"
        textFieldCreate.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFieldCreate.textColor = .black
        textFieldCreate.backgroundColor = .white
        textFieldCreate.layer.cornerRadius = CGFloat(12)
        textFieldCreate.layer.borderWidth = 1
        textFieldCreate.layer.borderColor = UIColor.black.cgColor
        textFieldCreate.translatesAutoresizingMaskIntoConstraints = false
        textFieldCreate.addPaddingView()
        
        return textFieldCreate
    }()
    //Создаю setStatusButton синяя кнопка
    private lazy var setStatusButton: UIButton = {
        let buttonBlue = UIButton()
        buttonBlue.backgroundColor = .blue
        buttonBlue.setTitle("Show status", for: .normal)
        buttonBlue.setTitleColor(.white, for: .normal)
        buttonBlue.translatesAutoresizingMaskIntoConstraints = false
        buttonBlue.layer.shadowColor = UIColor.black.cgColor
        buttonBlue.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonBlue.layer.shadowRadius = CGFloat(4)
        buttonBlue.layer.shadowOpacity = Float(0.7)
        buttonBlue.layer.cornerRadius = 4
        buttonBlue.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return buttonBlue
    }()
    //Нопка на нижнюю часть экрана
    let anotherButton: UIButton = {
        let button = UIButton()
        button.setTitle("another button", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -  Class Initializer Инициализатор Класса
    
    //Инициализатор
    override init(frame: CGRect) {
        super.init(frame: frame)
        addingViewsFromProfileHeaderView()
        addigLayouts()
        
        statusTextField.delegate = self

    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    //MARK: - Class Methods Методы Класса
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //Метод добавления Views на экран
    func addingViewsFromProfileHeaderView() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(backView)
        addSubview(closeButton)
        addSubview(avatarImageView)

        
        
    }
    
    //Метод добавленя Constraints
    func addigLayouts() {
        //Выставляю констрейнты для остальных вью
        NSLayoutConstraint.activate([
           

            //fullNameLabel констрейнты
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 190),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 165),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //statusLabel констрейнты
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 67),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 190),
            statusLabel.widthAnchor.constraint(equalToConstant: 165),
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //statusTextField констрейнты
            statusTextField.topAnchor.constraint(equalTo: topAnchor, constant: 117),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 190),
            statusTextField.widthAnchor.constraint(equalToConstant: 165),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //setStatusButton констрейнты
            setStatusButton.topAnchor.constraint(equalTo: topAnchor, constant: 182),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            //avatarImageView констрейнты
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),

            //backView констрейнты
            backView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

            //closeButton конестрейнты
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    

    //Метод при нажатии на кнопку выводит в консоль текст из statusLabel
    @objc func buttonPressed() {
        let textToPrint = statusLabel.text
        print("\(String(describing: textToPrint))")
        
        let isEmptyStatusTextField = statusTextField.text == ""
        if isEmptyStatusTextField {
            statusTextField.backgroundColor = .red
            statusTextField.layer.borderColor = UIColor.tintColor.cgColor
            statusTextField.shake()

            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                self.statusTextField.backgroundColor = .white
                self.statusTextField.layer.borderColor = UIColor.black.cgColor
            }
        } else {
            statusLabel.text = statusTextField.text
            statusTextField.text = ""
        }
    }
    
    //Метод avatarTap() при нажатии на аватар увеливчивает его на весь экран
    @objc private func avatarTap() {
        
        print("Avatar Tapped")
        UIView.animate(withDuration: 0.5, animations: {
            self.avatarImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.backView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 395, height: 710))
            self.avatarImageView.center = self.backView.center
            self.avatarImageView.layer.cornerRadius = 0
            self.backView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
                self.backView.alpha = 1
            }
        }
    }
    
    //Метод closeButtonTap() метод сворачивает обратно аватар
    @objc private func closeButtonTap() {
        
        print("Tapped closeButton")
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.avatarImageView.frame = .init(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
                self.avatarImageView.transform = .identity
                self.avatarImageView.layer.cornerRadius = 50
                self.backView.alpha = 0
            })

        }
    }
  
}

    //MARK: - Class Extension Расширения Класса

extension ProfileHeaderView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textToPrint = statusLabel.text
        print("\(String(describing: textToPrint))")
        
        let isEmptyStatusTextField = statusTextField.text == ""
        if isEmptyStatusTextField {
            statusTextField.backgroundColor = .red
            statusTextField.layer.borderColor = UIColor.tintColor.cgColor
            statusTextField.shake()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                self.statusTextField.backgroundColor = .white
                self.statusTextField.layer.borderColor = UIColor.black.cgColor
            }
        } else {
            statusLabel.text = statusTextField.text
            statusTextField.text = ""
        }
        
        return true
    }
}
