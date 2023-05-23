import UIKit

class ProfileViewController: UIViewController {
    //Создаю экземпляр posts из структуры Post присваиваю метод makePosts()
    private var posts = Post.makePosts()
    private var galleryOnScreen = PhotoViewStruct.makeGallery()

    //Создаю tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray4
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        //Выставляю высоту ячеек
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
        addingLayouts()
        
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
        let photosGallery = PhotosViewController()
        navigationController?.pushViewController(photosGallery, animated: true)
    }
    
}

//Расширяю ProfileViewController и подписываюсь под протокол UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            let countOfRowsInSectionFirst = 1
            return countOfRowsInSectionFirst
        } else if section >= 1 {
            let countOfRowsInSection = posts[section].count
            return countOfRowsInSection
        } else {
            return posts[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cellOne = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cellOne.setupCellGallery(insertCellPhotos: galleryOnScreen[indexPath.row])
            return cellOne
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            cell.setupCell(insertPost: posts[indexPath.section][indexPath.row])
            return cell
        }
    }

}
