//
//  DecorateLetterViewController.swift
//  ToYou
//
//  Created by any on 2/21/24.
//

import UIKit

class DecorateLetterViewController: UIViewController {
  private let mainView = DecorateLetterView()
  
  var letterText: String?
  var backgroundColor: UIColor?
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightButtonTapped))
    
    navigationItem.rightBarButtonItem = rightButton
    
    setUI()
  }
  
  func setUI(){
    mainView.letterTextView.text = letterText
  }
  
  @objc func rightButtonTapped() {
    
  }
}
