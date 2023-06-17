import UIKit

protocol ProfileViewControllerDelegate {
    func addLikes(post: Post)
}

class ProfileViewController: UIViewController {
    
    //MARK: - Class Properties Cвойства Класса
    
    //Создаю экземпляр posts из структуры Post присваиваю метод makePosts()
    var postsArrayArray = Post.makePosts()
    private var galleryOnScreen = PhotoViewStruct.makeGallery()
    var post = Post.makePostsWithArray()
    var postNumberOne = Post(authorPost: "Marat Avzalov", descriptionPost: "This is my Post", imagePost: UIImage(named: "Photo")!, likesPost: 650, viewsPost: 1000)
    var postNumberTwo = Post(authorPost: "MDK", descriptionPost: "This cat is Cool for You today", imagePost:  UIImage(named: "MDKPost")!, likesPost: 1500, viewsPost: 100000000)
    var postNumberThree = Post(authorPost: "Travel", descriptionPost: "Nice Weather Nice Shine", imagePost: UIImage(named: "NicePost")!, likesPost: 1500, viewsPost: 1000000000000)
    var postNumberFour = Post(authorPost: "Post with Love", descriptionPost: "Love is...", imagePost: UIImage(named: "LoveIsPost")!, likesPost: 5000, viewsPost: 500000000000)
    var postsArray = [Post]()
    var delegate: ProfileViewControllerDelegate?
    
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
        addingArrays()
        
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
        if indexPath.row == 0 {
            let photosGallery = PhotosViewController()
            navigationController?.pushViewController(photosGallery, animated: true)
        } else {
            let postPresentDetailVC = PostPresentDetailVC()
            postPresentDetailVC.setupVC(insertPost: postsArray[indexPath.row - 1], indexPath: indexPath)
            present(postPresentDetailVC, animated: true)
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
//            postsArrayArray[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            
            tableView.endUpdates()
        }
    }
}

//MARK: - Class Extention Расширения Класса

//Расширяю ProfileViewController и подписываюсь под протокол UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postsArray.count + 1
//        
//        if section == 0 {
//            return 1
//        } else if section == 1 {
//            return 1
//        } else if section == 2 {
//            return 1
//        } else if section == 3 {
//            return 1
//        } else if section == 4 {
//            return 1
//        } else {
//            return postsArray.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCellGallery(insertCellPhotos: galleryOnScreen[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            cell.setupCell(insertPost: postsArray[indexPath.row - 1])
            cell.likesView.isUserInteractionEnabled = true
//            cell.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell.tapLikes)))
            cell.tapLikes = {
                if !self.postsArray[indexPath.row].isLike {
                        self.postsArray[indexPath.row].likesPost += 1
                        self.postsArray[indexPath.row].isLike = true
                        self.tableView.reloadData()
                }
                                    
            }
            
            return cell
        }
        
        
        
        
        
//        if indexPath.section == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//            cell.setupCell(insertPost: postsArrayArray[indexPath.section][indexPath.row])
//            cell.setupCell(insertPost: post[indexPath.row])
//            cell.authorTextLabel.text =  postNumberOne.authorPost
//            cell.imagePostView.image = postNumberOne.imagePost
//            cell.descriptionTextLabel.text = postNumberOne.descriptionPost
//            cell.likesView.text = "Likes: \(String(postNumberOne.likesPost))"
//            cell.viewViews.text = "Views: \(String(postNumberOne.viewsPost))"
//            cell.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell.tapLikes)))
//            cell.likesView.isUserInteractionEnabled = true
//
//            return cell
//        } else if indexPath.section == 2 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//            cell.authorTextLabel.text =  postNumberTwo.authorPost
//            cell.imagePostView.image = postNumberTwo.imagePost
//            cell.descriptionTextLabel.text = postNumberTwo.descriptionPost
//            cell.likesView.text = "Likes: \(String(postNumberTwo.likesPost))"
//            cell.viewViews.text = "Views: \(String(postNumberTwo.viewsPost))"
//            cell.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cell.tapLikes)))
//            cell.likesView.isUserInteractionEnabled = true
//
//            return cell
//        } else if indexPath.section == 3 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//            cell.authorTextLabel.text =  postNumberThree.authorPost
//            cell.imagePostView.image = postNumberThree.imagePost
//            cell.descriptionTextLabel.text = postNumberThree.descriptionPost
//            cell.likesView.text = "Likes: \(String(postNumberThree.likesPost))"
//            cell.viewViews.text = "Views: \(String(postNumberThree.viewsPost))"
////                cell.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLikes)))
//            cell.likesView.isUserInteractionEnabled = true
//
//            return cell
//        } else if indexPath.section == 4 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//            cell.authorTextLabel.text =  postNumberFour.authorPost
//            cell.imagePostView.image = postNumberFour.imagePost
//            cell.descriptionTextLabel.text = postNumberFour.descriptionPost
//            cell.likesView.text = "Likes: \(String(postNumberFour.likesPost))"
//            cell.viewViews.text = "Views: \(String(postNumberFour.viewsPost))"
////                cell.likesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLikes)))
//            cell.likesView.isUserInteractionEnabled = true
//
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//            return cell
//        }
    }
}
