import UIKit

class TabBarVC: UITabBarController {

  lazy var profileVC: UINavigationController = {
    let profile = ProfileVC()
//          profile.user = AppUser(from: FirebaseAuthService.manager.currentUser!)
//          profile.isCurrentUser = true
    return UINavigationController(rootViewController: profile)
  }()
  
  lazy var createVC: UINavigationController = {
          let create = CreateVC()
          return UINavigationController(rootViewController: create)
      }()
        
    lazy var compsVC: UINavigationController = {
        let comps = CompsVC()
        return UINavigationController(rootViewController: comps)
    }()
  

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "heart"), tag: 0)
        createVC.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "calendar"), tag: 1)
        compsVC.tabBarItem = UITabBarItem(title: "Fit Comps", image: UIImage(systemName: "Fit Comps"), tag: 2)
        self.viewControllers = [profileVC, createVC, compsVC]
    }
}
