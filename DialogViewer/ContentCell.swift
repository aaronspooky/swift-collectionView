//
//  ContentCell.swift
//  DialogViewer
//
//  Created by Sergio A. Balderas on 03/07/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
  
  var label: UILabel!
  var text: String! {
    get {
      return label.text
    }
    set(newText) {
      label.text = newText
      var newLabelFrame = label.frame
      var newContentFrame = contentView.frame
      let textSize = ContentCell.sizeForContentString(s: newText, forMaxWidth: maxWidth)
      newLabelFrame.size = textSize
      newContentFrame.size = textSize
      label.frame = newLabelFrame
      contentView.frame = newContentFrame
    }
  }
  
  var maxWidth: CGFloat!
  
//  class func sizeForContentString(s: String, forMaxWidth: CGFloat) -> CGSize {
//    return CGSize.zero
//  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    label = UILabel(frame: self.contentView.bounds)
    label.isOpaque = false
    label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
    label.textColor = UIColor.blue
    label.textAlignment = .center
//    label.font = defaultFont()
    
    contentView.addSubview(label)
    
  }
  class func defaultFont() -> UIFont {
    //      return UIFont.systemFont(ofSize: 17)
    return UIFont.preferredFont(forTextStyle: .body)
  }
  
  class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {
    let maxSize = CGSize(width: maxWidth, height: 1000.0)
    let opts = NSStringDrawingOptions.usesLineFragmentOrigin
    
    let style = NSMutableParagraphStyle()
    style.lineBreakMode = NSLineBreakMode.byCharWrapping
    let attributes = [NSFontAttributeName: defaultFont(), NSParagraphStyleAttributeName: style]
    let string = s as NSString
    let rect = string.boundingRect(with: maxSize, options: opts, attributes: attributes, context: nil)
    
    return rect.size
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
