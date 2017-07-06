//
//  HeaderCell.swift
//  DialogViewer
//
//  Created by Sergio A. Balderas on 05/07/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  class HeaderCell: ContentCell {
    override init(frame: CGRect) {
      super.init(frame: frame)
      label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
      label.textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
