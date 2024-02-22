//
//  letterTextBoxView.swift
//  ToYou
//
//  Created by any on 2/21/24.
//

import UIKit

class LetterTextView: UITextView {
  
  var lineHeight: CGFloat = 13.8
  
  override var font: UIFont? {
    didSet {
      if let newFont = font {
        lineHeight = newFont.lineHeight
      }
    }
  }
  
  override func draw(_ rect: CGRect) {
    let ctx = UIGraphicsGetCurrentContext()
    ctx?.setStrokeColor(UIColor.black.cgColor)
    let numberOfLines = Int(rect.height / lineHeight)
    
    for i in 1...numberOfLines {
      let topInset = Double(16 * i)
      let y = topInset + CGFloat(i) * lineHeight
      let line = CGMutablePath()
      line.move(to: CGPoint(x: 0.0, y: y))
      line.addLine(to: CGPoint(x: rect.width, y: y))
      ctx?.addPath(line)
    }
    
    ctx?.strokePath()
    
    super.draw(rect)
  }
}
