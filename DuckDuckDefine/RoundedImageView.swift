//
//  RoundedImageView.swift
//  DuckDuckDefine
//
//  Created by James Frost on 11/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = bounds.width / 2
  }
  
}
