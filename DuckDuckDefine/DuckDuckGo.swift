//
//  DuckDuckGo.swift
//  DuckDuckDefine
//
//  Created by James Frost on 10/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import Foundation

struct Definition {
  let title: String
  let description: String
  let imageURL: NSURL?
}

class DuckDuckGo {
  
  enum ResultType: String {
    case Answer = "A"
    case Exclusive = "E"    // Exclusive results include special cases like calculations
  }
  func performSearch(searchTerm: String, completion: ((definition: Definition?) -> Void)) {
    completion(definition: nil)
  }
}
