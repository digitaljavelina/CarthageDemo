//
//  AppDelegate.swift
//  DuckDuckDefine
//
//  Created by James Frost on 09/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }
}

extension UINavigationController {
  public override func childViewControllerForStatusBarStyle() -> UIViewController? {
    return topViewController
  }
}

class DefinitionSegueContext: NSObject {
  let definition: Definition
  
  init(definition: Definition) {
    self.definition = definition
    super.init()
  }
}