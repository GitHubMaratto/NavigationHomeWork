import UIKit

protocol ProfileViewControllerDelegate {
    func addLikes(post: Post)
}

class ProfileViewController: UIViewController {
    
    //MARK: - Class Properties Cвойства Класса
    
    //Создаю экземпляр galleryOnScreen из структуры PhotoViewStruct присваиваю метод makeGallery()
    private var galleryOnScreen = PhotoViewStruct.makeGallery()
    //Создаю пост postNumberOne
    var postNumberOne = Post(authorPost: "Marat Avzalov", descriptionPost: "This is my Post", imagePost: UIImage(named: "Photo")!, likesPost: 650, viewsPost: 1000)
    //Создаю пост postNumberTwo
    var postNumberTwo = Post(authorPost: "MDK", descriptionPost: "This cat is Cool for You today", imagePost:  UIImage(named: "MDKPost")!, likesPost: 1500, viewsPost: 100000000)
    //Создаю пост postNumberThree
    var postNumberThree = Post(authorPost: "Travel", descriptionPost: "Nice Weather Nice Shine", imagePost: UIImage(named: "NicePost")!, likesPost: 1500, viewsPost: 1000000000000)
    //Создаю пост postNumberFour
    var postNumberFour = Post(authorPost: "Post with Love", descriptionPost: "Love is...", imagePost: UIImage(named: "LoveIsPost")!, likesPost: 5000, viewsPost: 500000000000)
    //Создаю массив postsArray
    var postsArray = [Post]()
    
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
    
    //MARK: - Class Methods Методаы Класса
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
        addingLayouts()
        addingArrays()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    func addingArrays() {
        postsArray.append(postNumberOne)
        postsArray.append(postNumberTwo)
        postsArray.append(postNumberThree)
        postsArray.append(postNumberFour)
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
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            
            tableView.beginUpdates()
           
            postsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            
            tableView.endUpdates()
        }
    }
}

//MARK: - Class Extention Расширения Класса

//Расширяю ProfileViewController и подписываюсь под протокол UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCellGallery(insertCellPhotos: galleryOnScreen[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            cell.setupCell(insertPost: postsArray[indexPath.row])
                cell.tapViews = {
                    let postPresentDetailVC = PostPresentDetailVC()
                    self.postsArray[indexPath.row].viewsPost += 1
                    self.tableView.reloadData()
                    self.present(postPresentDetailVC, animated: true)
                    postPresentDetailVC.setupVC(insertPost: self.postsArray[indexPath.row], indexPath: indexPath)
                }
                cell.tapLikes = {
                    if !self.postsArray[indexPath.row].isLike {
                            self.postsArray[indexPath.row].likesPost += 1
                            self.postsArray[indexPath.row].isLike = true
                            self.tableView.reloadData()
                    }
                                        
                }
            
            return cell
        }
        
    }
}
