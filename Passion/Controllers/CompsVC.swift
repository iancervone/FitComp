import UIKit

class CompsVC: UIViewController {
  
//  lazy var  header: UILabel = {
//  let label = UILabel()
//     label.font = UIFont(name: "AvenirNext-UltraLight", size: 40)
//     label.text = "Comps"
//     label.textAlignment = .center
//     label.textColor = .white
//     return label
//   }()
  
  lazy var compsCV: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView()
    layout.scrollDirection = .vertical
    cv.backgroundColor = .clear
//    cv.dataSource = self
//    cv.delegate = self
    cv.register(CompsCVC.self, forCellWithReuseIdentifier: "compCell")
    return cv
  }()

  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        compsVCSetUp()

    }
  
  
  func setNavigationBar() {
    let screenSize: CGRect = UIScreen.main.bounds
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: screenSize.width, height: 144))
    let navItem = UINavigationItem(title: "COMPETITIONS")
//    let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: nil, action: #selector(done))
//      navItem.rightBarButtonItem = doneItem
      navBar.setItems([navItem], animated: false)
      self.view.addSubview(navBar)
  }
    

  private func compsVCSetUp() {
    view.addSubview(compsCV)
    compsCV.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      compsCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      compsCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      compsCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      compsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  

}
