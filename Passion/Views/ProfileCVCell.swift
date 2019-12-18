import UIKit

class ProfileCVCell: UICollectionViewCell {
     
    lazy var cellPic: UIImageView = {
      let pic = UIImageView()
      pic.image = UIImage(named: "chalkClap.png")!
      return pic
    }()
  
  lazy var cellNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0, green: 0.4235294118, blue: 1, alpha: 1)
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
        cellPic.centerYAnchor.constraint(equalTo: self.centerYAnchor) ,
        cellPic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        cellPic.heightAnchor.constraint(equalToConstant: 120),
        cellPic.widthAnchor.constraint(equalToConstant: 120)
      ])
    }
    
  private func cellNameLabelSetup() {
    contentView.addSubview(cellNameLabel)
    cellNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cellNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      cellNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      cellNameLabel.heightAnchor.constraint(equalToConstant: 20),
      cellNameLabel.widthAnchor.constraint(equalToConstant: 120)
    ])  }
    
  }
