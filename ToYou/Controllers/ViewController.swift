//
//  ViewController.swift
//  ToYou
//
//  Created by any on 2/16/24.
//

import UIKit

class ViewController: UIViewController {
  private let mainView = MainView()
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setAddTarget()
  }
  
  func setAddTarget() {
    mainView.sendLetterButton.addTarget(self, action: #selector(tapPresentBtn), for: .touchUpInside)
  }
  
  @objc func tapPresentBtn() {
    let nextVC = SendLetterViewController()
    
    self.show(nextVC, sender: nil)
  }
}

