import UIKit

class CompsCVC: UICollectionViewCell {
 
  lazy var cellPic: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "chalkClap.png")!
        pic.layer.borderWidth = 2.0
        pic.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pic.layer.masksToBounds = true
        return pic
      }()
    
    lazy var cellNameLabel: UILabel = {
      let label = UILabel()
      label.text = "Ian Cervone"
      label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      label.textAlignment = .center
      return label
    }()
      
      override init(frame: CGRect) {
        super.init(frame: .zero)
        cellPicSetup()
        cellNameLabelSetup()
      }
      
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      
      private func cellPicSetup() {
        contentView.addSubview(cellPic)
        cellPic.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          cellPic.topAnchor.constraint(equalTo: self.topAnchor),
          cellPic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
          cellPic.heightAnchor.constraint(equalToConstant: 120),
          cellPic.widthAnchor.constraint(equalToConstant: 120),
        ])
      }

      
    private func cellNameLabelSetup() {
      contentView.addSubview(cellNameLabel)
      cellNameLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cellNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
        cellNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        cellNameLabel.heightAnchor.constraint(equalToConstant: 20),
        cellNameLabel.widthAnchor.constraint(equalToConstant: 120)
      ])
      }
      
    }
