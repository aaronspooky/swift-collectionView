//
//  ViewController.swift
//  DialogViewer
//
//  Created by Sergio A. Balderas on 03/07/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "CONTENT"

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  private var sections = [
      ["header": "First Witch", "content": "Hey, when will the three of us meet up later?"]
  ]

    override func viewDidLoad() {
        super.viewDidLoad()

      var contentInset = collectionView!.contentInset
      contentInset.top = 20
      collectionView!.contentInset = contentInset
      
      let layout = collectionView!.collectionViewLayout
      let flow = layout as! UICollectionViewFlowLayout
      flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20)
      flow.headerReferenceSize = CGSize(width: 100, height: 25)
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
      self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
      self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HEADER")
      
      
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func wordsInSection(section: Int) -> [String] {
    let content = sections[section]["content"]
    let spaces = NSCharacterSet.whitespacesAndNewlines
    let words = content?.components(separatedBy: spaces)
    
    return words!
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section)
      return words.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      let words = wordsInSection(section: indexPath.section)
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell
      cell.maxWidth = collectionView.bounds.size.width
      cell.text = words[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if (kind == UICollectionElementKindSectionHeader) {
      let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath) as! HeaderCell
      cell.maxWidth = collectionView.bounds.size.width
      cell.text = sections[indexPath.section]["header"]
    return cell
    }
    abort()
  }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let words = wordsInSection(section: indexPath.section)
    let size = ContentCell.sizeForContentString(s: words[indexPath.row], forMaxWidth: collectionView.bounds.size.width)
    
    return size
  }

}
