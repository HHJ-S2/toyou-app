//
//  SendLetterView.swift
//  ToYou
//
//  Created by any on 2/19/24.
//

import UIKit

class SendLetterView: UIView {
  private lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.addSubview(letterTextViewWrapper)
    return view
  }()
  
  lazy var letterTextViewWrapper: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
    view.addSubview(letterTextView)
    return view
  }()
  
  lazy var letterTextView: UITextView = {
    let textView = UITextView();
    textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16);
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
    textView.backgroundColor = .white
    textView.font = UIFont.systemFont(ofSize: 20)
    
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
    
    letterTextViewWrapper.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextViewWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      letterTextViewWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      letterTextViewWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
      letterTextViewWrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    letterTextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      letterTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
      letterTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      letterTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//      letterTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}
