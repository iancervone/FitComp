import UIKit

class ProfileVC: UIViewController {
//
////  lazy var barItem: UIBarButtonItem = {
////    let item = UIBarButtonItem()
////    self.navigationItem.titleView = self.searchBar
////    return item
////  }()
//
//  lazy var navBar: UINavigationBar = {
//  let nav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
////      nav = UINavigationItem(title: "")
//    let search = UINavigationItem()
//  let edit = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorName:))
//  navItem.rightBarButtonItem = edit
//
//  navBar.setItems([nav], animated: false)
//    return nav
//  }()
//
  
  lazy var searchBar: UISearchBar = {
    let sb = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
     sb.text = "enter the name of a piece"
//      sb.sizeToFit()
//
      navigationItem.titleView = sb

     return sb
  }()
  
  lazy var profilePic: UIImageView = {
    let pic = UIImageView()
    pic.image = UIImage(named: "chalkClap.png")!
    pic.layer.cornerRadius = (view.frame.size.width / 1.2) / 2
    pic.layer.borderWidth = 3
    pic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    pic.layer.masksToBounds = true
//    pic.clipsToBounds = false
    return pic
  }()
  
//  pic.layer.cornerRadius = pic.frame.size.width / 2

  
  lazy var  nameLabel: UILabel = {
   let label = UILabel()
      label.font = UIFont(name: "AvenirNext-UltraLight", size: 40)
      label.text = "Ian Cervone"
      label.textAlignment = .center
      label.textColor = .white
      return label
    }()
  
  lazy var teammateCountLabel: UILabel = {
    let label = UILabel()
    label.text = "# TEAMMATES"
    label.textAlignment = .center
    label.textColor = .white
    label.backgroundColor = .black
    label.layer.borderWidth = 0.5
    label.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return label
  }()
  
  lazy var compsCountLabel: UILabel = {
    let label = UILabel()
    label.text = "# COMPETITIONS"
    label.textAlignment = .center
    label.textColor = .white
    label.backgroundColor = .black
    label.layer.borderWidth = 0.5
    label.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      return label
    }()
  
  lazy var profileCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    cv.backgroundColor = .clear
    cv.dataSource = self
    cv.delegate = self
    cv.register(ProfileCVCell.self, forCellWithReuseIdentifier: "profileCell")
    return cv
  }()
  
  
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .gray
      setupViews()
//      navigationItem.titleView = searchBar
    
  
  self.setNavigationBar()
  }

  func setNavigationBar() {
    let screenSize: CGRect = UIScreen.main.bounds
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: screenSize.width, height: 144))
    let navItem = UINavigationItem(title: "")
    let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: nil, action: #selector(done))
      navItem.rightBarButtonItem = doneItem
      navBar.setItems([navItem], animated: false)
      self.view.addSubview(navBar)
  }

  @objc func done() { // remove @objc for Swift 3

  }
  
  private func applyshadowWithCorner(containerView : UIImageView){
    containerView.clipsToBounds = true
    containerView.layer.shadowColor = UIColor.black.cgColor
    containerView.layer.shadowOpacity = 1
    containerView.layer.shadowOffset = CGSize.init(width: 400, height: 300)
    containerView.layer.shadowRadius = 1
    containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 0).cgPath
  }
  
  private func setupViews() {
    profilePicSetup()
//    applyshadowWithCorner(containerView: profilePic)
    nameLabelSetup()
    counterStackViewSetup()
    profileCollectionViewSetup()
  }
    
  private func profilePicSetup() {
    view.addSubview(profilePic)
    profilePic.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      profilePic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
      profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      profilePic.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.2),
      profilePic.heightAnchor.constraint(equalToConstant: view.frame.size.width / 1.2)
    ])
//    profilePic.layer.cornerRadius = profilePic.frame.height/2
  }
  
  private func nameLabelSetup() {
    view.addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 20),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      nameLabel.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
  
  private func counterStackViewSetup() {
        let stackView = UIStackView(arrangedSubviews: [teammateCountLabel, compsCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -2),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
            stackView.heightAnchor.constraint(equalToConstant: 35)
        ])
      }


  private func profileCollectionViewSetup() {
    view.addSubview(profileCollectionView)
    profileCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      profileCollectionView.bottomAnchor.constraint(equalTo:view .safeAreaLayoutGuide.bottomAnchor, constant: 0),
      profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      profileCollectionView.heightAnchor.constraint(equalToConstant: 150)
    ])
  }
  
}

extension ProfileVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return(25)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfileCVCell
        return cell
    }
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//      return CGSize(width: 200, height: 200)
//  }
  
  }


extension ProfileVC: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {

        }
    }
}

extension ProfileVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = CGSize(width: 130, height: 130)
        return cellSize
    }
}


