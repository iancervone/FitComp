//
//  OnboardSportVC.swift
//  Passion
//
//  Created by Ian Cervone on 1/7/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class OnboardSportVC: UIViewController {
  
  lazy var logoImage: UIImageView = {
    let image = UIImageView()
    return image
  }()
  
  lazy var headerLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var infoButton: UIButton = {
    let button = UIButton()
    return button
  }()
  
  lazy var collectionView: UICollectionView = {
    let cv = UICollectionView()
    return cv
  }()
  
  lazy var nextButton: UIButton = {
    let button = UIButton()
    return button
  }()
  
  lazy var progressBar: UIView = {
    let view = UIView()
    return view
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
