//
//  SendLetterViewController.swift
//  ToYou
//
//  Created by any on 2/19/24.
//

import UIKit

class SendLetterViewController: UIViewController {
  private let mainView = SendLetterView()
  
  var sendLetterTextViewBottomConstraint: NSLayoutConstraint!
  var canNavigate = false
  
  // 네비게이션 바 버튼 세팅
  var rightTextButton = UIBarButtonItem()
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.letterTextView.delegate = self
    
    rightTextButton.tintColor = UIColor.FlatColor.Gray.IronGray
    navigationItem.rightBarButtonItem = rightTextButton
    
    rightTextButton.title = "Next"
    rightTextButton.style = .plain
    rightTextButton.target = self
    rightTextButton.action = #selector(textButtonTapped)
    
    setNotification()
    setUI()
  }
  
  deinit {
    // 옵저버 해제
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc func textButtonTapped() {
    let nextVC = DecorateLetterViewController()
    
    nextVC.letterText = mainView.letterTextView.text
    mainView.letterTextView.resignFirstResponder()
    
    guard canNavigate else { return }
    
    self.show(nextVC, sender: nil)
  }
  
  private func setNotification() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }
  
  private func setUI() {
    sendLetterTextViewBottomConstraint = mainView.letterTextBoxView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    NSLayoutConstraint.activate([sendLetterTextViewBottomConstraint])
  }
  
  @objc private func keyboardWillShow(_ notification: Notification) {
    guard let userInfo = notification.userInfo as NSDictionary?,
          let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
      return
    }
    
    let keyboardFrameHeight = keyboardFrame.size.height
    sendLetterTextViewBottomConstraint.constant = -(keyboardFrameHeight)
  }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    sendLetterTextViewBottomConstraint.constant = -20
  }
}

extension SendLetterViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.FlatColor.Gray.Iron {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "메세지를 입력하세요"
      textView.textColor = UIColor.FlatColor.Gray.Iron
    }
  }
  
  func textViewDidChange(_ textView: UITextView) {
    let text = textView.text
    
    if text != "" && textView.textColor != UIColor.FlatColor.Gray.Iron {
      canNavigate = true
      rightTextButton.tintColor = .systemBlue
    } else {
      canNavigate = false
      rightTextButton.tintColor = UIColor.FlatColor.Gray.IronGray
    }
  }
  
  // textView 외에 영역을 탭했을때 키보드 내리기
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    mainView.letterTextView.resignFirstResponder()
  }
}
