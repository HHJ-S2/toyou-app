//
//  SendLetterView.swift
//  ToYou
//
//  Created by any on 2/19/24.
//

import UIKit

class SendLetterView: UIView {
  var lineHeight: CGFloat = 24
  
  private lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(letterTextWrapperView)
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
    
    // Placeholder 셋팅
    textView.text = "메세지를 입력하세요"
    textView.textColor = UIColor.FlatColor.Gray.Iron
    textView.isScrollEnabled = true
    
    // 수정 제안 비활성
    textView.autocorrectionType = .no
    textView.spellCheckingType = .no
    
    return textView
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
      letterTextBoxView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
    ])
    
    letterTextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextView.topAnchor.constraint(equalTo: self.letterTextBoxView.topAnchor, constant: 16),
      letterTextView.leadingAnchor.constraint(equalTo: self.letterTextBoxView.leadingAnchor, constant: 16),
      letterTextView.trailingAnchor.constraint(equalTo: self.letterTextBoxView.trailingAnchor, constant: -16),
      letterTextView.bottomAnchor.constraint(equalTo: self.letterTextBoxView.bottomAnchor, constant: -16)
    ])
  }
}
