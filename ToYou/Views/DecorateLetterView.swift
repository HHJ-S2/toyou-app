//
//  DecorateLetterView.swift
//  ToYou
//
//  Created by any on 2/22/24.
//

import UIKit

class DecorateLetterView: UIView {
  
  // MARK: 이전 화면과 동일한 뷰
  private lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(letterTextWrapperView)
    view.addSubview(decorateButton)
    return view
  }()
  
  lazy var letterTextWrapperView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
    view.addSubview(letterTextBoxView)
    return view
  }()
  
  lazy var letterTextBoxView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
    view.layer.borderWidth = 1
    view.addSubview(letterTextView)
    return view
  }()
  
  lazy var letterTextView: UITextView = {
    let textView = UITextView();
    textView.font = UIFont.systemFont(ofSize: 18)
    textView.isEditable = false
    return textView
  }()
  
  lazy var decorateButtonIcon: UIImageView = {
    let imgView = UIImageView(image: UIImage(systemName: "paintbrush.fill"))
    imgView.tintColor = .white
    return imgView
  }()
  
  // MARK: 꾸미기 버튼
  lazy var decorateButton: UIButton = {
    let btn = UIButton(type: .custom)
    
    var rect = CGRect()
    
    let buttonSize = 56.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    rect.size.width = buttonSize
    rect.size.height = buttonSize
    
    if let window = UIApplication.shared.windows.first {
      let safeAreaBottomInset = window.safeAreaInsets.bottom
      
      // CGRect의 y 값을 Safe Area의 하단 여백 값으로 지정하기
      let y = safeAreaBottomInset
      let padding = 32.0
      
      rect.origin = CGPoint(
        x: screenWidth - buttonSize - padding,
        y: screenHeight - buttonSize - padding - y
      )
    }
    
    btn.frame = rect
    btn.backgroundColor = UIColor.FlatColor.Blue.Chambray
    btn.clipsToBounds = true
    btn.layer.cornerRadius = btn.frame.width / 2
    btn.addSubview(decorateButtonIcon)
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
  
  // MARK: Constraints
  
  private func setConstraints() {
    container.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    letterTextWrapperView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextWrapperView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      letterTextWrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      letterTextWrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      letterTextWrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    letterTextBoxView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextBoxView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
      letterTextBoxView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      letterTextBoxView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
      letterTextBoxView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
    
    letterTextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextView.topAnchor.constraint(equalTo: letterTextBoxView.topAnchor, constant: 16),
      letterTextView.leadingAnchor.constraint(equalTo: letterTextBoxView.leadingAnchor, constant: 16),
      letterTextView.trailingAnchor.constraint(equalTo: letterTextBoxView.trailingAnchor, constant: -16),
      letterTextView.bottomAnchor.constraint(equalTo: letterTextBoxView.bottomAnchor, constant: -16)
    ])
    
    decorateButtonIcon.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      decorateButtonIcon.centerXAnchor.constraint(equalTo: decorateButton.centerXAnchor),
      decorateButtonIcon.centerYAnchor.constraint(equalTo: decorateButton.centerYAnchor),
      decorateButtonIcon.widthAnchor.constraint(equalToConstant: 24),
      decorateButtonIcon.heightAnchor.constraint(equalToConstant: 24),
    ])
  }
}
