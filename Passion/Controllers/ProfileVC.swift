import UIKit

class ProfileVC: UIViewController {
  
//  lazy var barItem: UIBarButtonItem = {
//    let item = UIBarButtonItem()
//    self.navigationItem.titleView = self.searchBar
//    return item
//  }()
//
//lazy var searchBar: UISearchBar = {
//           let sb = UISearchBar()
//           sb.text = "enter the name of a piece"
//           return sb
//         }()
  
  lazy var profilePic: UIImageView = {
    let pic = UIImageView()
    pic.image = UIImage(named: "chalkClap.png")!
//    pic.layer.cornerRadius = pic.frame.size.height/2
    pic.layer.borderWidth = 1.0
    pic.layer.borderColor = #colorLiteral(red: 0, green: 0.3761399504, blue: 1, alpha: 1)
//    pic.layer.masksToBounds = true
//    pic.clipsToBounds = true
    return pic
  }()
  
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
    let cv = UICollectionView()
    return cv
  }()
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .gray
      setupViews()
    }
  
  private func setupViews() {
    profilePicSetup()
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
      profilePic.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
      profilePic.heightAnchor.constraint(equalToConstant: view.frame.size.width / 1.5)
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
      profileCollectionView.bottomAnchor.constraint(equalTo:view .safeAreaLayoutGuide.bottomAnchor, constant: -20),
      profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      profileCollectionView.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  
}
