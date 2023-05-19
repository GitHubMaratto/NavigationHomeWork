import Foundation
import UIKit

class ProfileHeaderView: UIView {
    var profileHeaderViewConstraints = UIView()
    let viewController = UIViewController()
    //Создаю blueView
    let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = UIColor.appColor(.myColor)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }()
    //Создаю avatarImageView аватар с котом
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catwhite.jpg")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        
        return image
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
        textFieldCreate.placeholder = "Whrite me my status"
        textFieldCreate.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFieldCreate.textColor = .black
        textFieldCreate.backgroundColor = .white
        textFieldCreate.layer.cornerRadius = CGFloat(12)
        textFieldCreate.layer.borderWidth = 1
        textFieldCreate.layer.borderColor = UIColor.black.cgColor
        textFieldCreate.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    //Инициализатор
    override init(frame: CGRect) {
        super.init(frame: frame)
        addingViewsFromProfileHeaderView()
        addigLayouts()

    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //Метод добавления Views на экран
    func addingViewsFromProfileHeaderView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }
    
    //Метод добавленя Constraints
    func addigLayouts() {
        //Выставляю констрейнты для остальных вью
        NSLayoutConstraint.activate([
            //avatarImageView констрейнты
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
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
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    

    //Метод при нажатии на кнопку выводит в консоль текст из statusLabel
    @objc func buttonPressed() {
        let textToPrint = statusLabel.text
        print("\(String(describing: textToPrint))")
    }
  
}
