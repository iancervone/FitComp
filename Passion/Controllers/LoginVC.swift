import UIKit
import FirebaseAuth


class LoginVC: UIViewController {
    
//MARK: VIEWS
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "FitComp"
        label.font = UIFont(name: "AvenirNext-UltraLight", size: 90)
        label.textColor = .systemBlue
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
  
  
    lazy var signUpButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("SIGN UP", for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
          button.titleLabel?.font = UIFont(name: "PingFang TC", size: 20)
          button.backgroundColor = .clear
      button.setTitleColor(.systemBlue, for: .normal)
          button.isEnabled = true
          button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
          return button
      }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: " Enter Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "PingFang TC", size: 20)
        textField.backgroundColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2474850171)
      //background opacity set to 25%
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: " Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "PingFang TC", size: 20)
        textField.backgroundColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2474850171)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textColor = .white
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()

  
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont(name: "PingFang TC", size: 30)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4235294118, blue: 1, alpha: 0.5924122432)
        button.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
  

//MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "chalkClap.png")!)
        setupSubviews()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

//MARK: Obj-C methods

    @objc func validateFields() {
        guard emailTextField.hasText, passwordTextField.hasText else {
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = true
        loginButton.backgroundColor = #colorLiteral(red: 0, green: 0.4235294118, blue: 1, alpha: 0.9470248288)
        loginButton.layer.borderWidth = 3
      

    }

    @objc func showSignUp() {
        let signupVC = SignUpVC()
        print("button pressed")
        signupVC.modalPresentationStyle = .formSheet
        present(signupVC, animated: true, completion: nil)
    }

    @objc func tryLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(with: "Error", and: "Please fill out all fields.")
            return
        }

//MARK: - remove whitespace (if any) from email/password
  
        guard email.isValidEmail else {
            showAlert(with: "Error", and: "Please enter a valid email")
            return
        }

        guard password.isValidPassword else {
            showAlert(with: "Error", and: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }

        FirebaseAuthService.manager.loginUser(email: email.lowercased(), password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
    }

//MARK: Private methods

    private func showAlert(with title: String, and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .failure(let error):
            showAlert(with: "Error", and: "Could not log in. Error: \(error)")
        case .success:
            let nextVC = ProfileVC()
            print("button pressed")
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)

//            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,Fire
//                let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
//                else {
//                    //MARK: TODO - handle could not swap root view controller
//                    return
//            }
//
//            //MARK: TODO - refactor this logic into scene delegate
//            //MARK: MAKE ANIMATION SLIDE FROM LEFT TO RIGHT
//            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
//                    window.rootViewController = ChooseExperienceVC()
//            }, completion: nil)
        }
    }
    
//MARK: UI Setup
    
    private func setupSubviews() {
      titleLabelSetup()
      emailPasswordStackViewSetUp()
      signUpButtonSetUp()
    }
    
  
    private func titleLabelSetup() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
          titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
          titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
          titleLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
  
  
  
    private func emailPasswordStackViewSetUp() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 180)
        ])
      }
  
  private func signUpButtonSetUp() {
    view.addSubview(signUpButton)
    signUpButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      signUpButton.heightAnchor.constraint(equalToConstant: 30),
      signUpButton.widthAnchor.constraint(equalToConstant: 100),
      signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
}





extension LoginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
