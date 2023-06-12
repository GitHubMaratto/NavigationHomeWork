import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Class Properties Cвойства Класса
    
    //Создаю экземпляр posts из структуры Post присваиваю метод makePosts()
    var postsArray = Post.makePostsWithArray()
    var postsArrayArray = Post.makePosts()
    private var galleryOnScreen = PhotoViewStruct.makeGallery()
  
    var postOne = Post(authorPost: "123", descriptionPost: "123", imagePost: UIImage(named: "Photo")!, likesPost: 650, viewsPost: 1000)
    
    //Создаю tableView
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray4
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        
        //Выставляю высоту ячеек
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    //MARK: -  Class Initializer Инициализатор Класса
    
 
    
    //MARK: - Class Methods Методаы Класса
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
        addingLayouts()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    //Метод addingViews добавляет view на экран
    func addingViews() {
        view.addSubview(tableView)
    }
     
    //Метод добавления LayoutConstraint
    func addingLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func addLike() {
        print("Tapped")
    }
    
}
//Расширю ProfileViewController и подписывваюсь под протокол UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let vw = ProfileHeaderView()
            NSLayoutConstraint.activate([
                vw.heightAnchor.constraint(equalToConstant: 250)
            ])
            return vw
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosGallery = PhotosViewController()
            navigationController?.pushViewController(photosGallery, animated: true)
        } else {
            let postPresentDetailVC = PostPresentDetailVC()
            postPresentDetailVC.setupVC(insertPost: postsArrayArray[indexPath.section][indexPath.row], indexPath: indexPath)
            present(postPresentDetailVC, animated: true)
        }
        
        
//        if indexPath.section == 1 {
//            let postPresentDetailVC = PostPresentDetailVC()
//            postPresentDetailVC.setupVC(insertPost: postsArrayArray[indexPath.section][indexPath.row], indexPath: indexPath)
//            present(postPresentDetailVC, animated: true)
//        } else if indexPath.section == 2 {
//            let postPresentTwo = PostPresentTwo()
//            present(postPresentTwo, animated: true)
//        } else if indexPath.section == 3 {
//            let postPresentThree = PostPresentThree()
//            present(postPresentThree, animated: true)
//        } else if indexPath.section == 4 {
//            let postPresentFour = PostPresentFour()
//            present(postPresentFour, animated: true)
//        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            postsArrayArray[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}

//Расширяю ProfileViewController и подписываюсь под протокол UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postsArrayArray[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCellGallery(insertCellPhotos: galleryOnScreen[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            cell.setupCell(insertPost: postsArrayArray[indexPath.section][indexPath.row])
            
            return cell
            
        }
    }
}
