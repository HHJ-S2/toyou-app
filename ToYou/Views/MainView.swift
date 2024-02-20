//
//  MainView.swift
//  ToYou
//
//  Created by any on 2/16/24.
//

import UIKit

class MainView: UIView {
  private lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(sendLetterButton)
    return view
  }()
  
  lazy var sendLetterButton: UIButton = {
    let btn = UIButton(type: .custom)
    
    btn.setTitle("편지 쓰기", for: .normal)
    btn.layer.backgroundColor = UIColor.FlatColor.Blue.Chambray.cgColor
    btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    // 외곽 보더
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 8
    
    btn.addTarget(self, action: #selector(sendLetterButtonTapped), for: .touchUpInside)
    return btn
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(container)
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraints() {
    container.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    sendLetterButton.translatesAutoresizingMaskIntoConstraints = false
    // 코드로 constant를 설정할 때, trailingAnchor / bottomAnchor에 한해서 storyboard와 달리 -(minus)를 붙여주어야 한다
    NSLayoutConstraint.activate([
      sendLetterButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      sendLetterButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      sendLetterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      sendLetterButton.heightAnchor.constraint(equalToConstant: 56) // 높이 제약
    ])
  }
  
  @objc func sendLetterButtonTapped() {
    print("sendLetterButtonTapped")
  }
}
