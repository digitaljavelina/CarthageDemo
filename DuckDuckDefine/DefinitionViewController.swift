//
//  DefinitionViewController.swift
//  DuckDuckDefine
//
//  Created by James Frost on 11/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
  
  @IBOutlet weak var imageView: RoundedImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var definition: Definition!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = definition.title
    descriptionLabel.text = definition.description
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
}
