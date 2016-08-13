//
//  ViewController.swift
//  DuckDuckDefine
//
//  Created by James Frost on 09/06/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  lazy var duckDuckGo = DuckDuckGo()
  
  var searchTerms = [String]()
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
  @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {}
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    performSearchForTerm(searchBar.text)
  }
  
  func saveSearchTerm(term: String) {
    if contains(self.searchTerms, term) {
      return
    }
    
    searchTerms.insert(term, atIndex: 0)
    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Left)
  }
  
  func performSearchForTerm(term: String) {
    activityIndicator.startAnimating()
    
    duckDuckGo.performSearch(term) { definition in
      self.activityIndicator.stopAnimating()
      
      if let definition = definition {
        self.saveSearchTerm(term)
        
        self.performSegueWithIdentifier("DefinitionSegue", sender: DefinitionSegueContext(definition: definition))
      } else {
        self.showNoDefinitionAlertForTerm(term)
      }
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let context = sender as? DefinitionSegueContext where segue.identifier == "DefinitionSegue" {
      let vc = segue.destinationViewController as! DefinitionViewController
      vc.definition = context.definition
    }
  }
  
  func showNoDefinitionAlertForTerm(term: String) {
    let alertController = UIAlertController(title: "Huh...", message: "No definition could be found for \(term). Try searching for something else?", preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil))
    
    presentViewController(alertController, animated: true, completion: nil)
  }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchTerms.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
    
    cell.textLabel!.text = searchTerms[indexPath.row]
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSearchForTerm(searchTerms[indexPath.row])
  }
}
