//
//  ViewController.swift
//  TheGallery
//
//  Created by Chase McElroy on 7/8/16.
//  Copyright © 2016 Chase McElroy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var gallery = [Art]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        updateGallery()
        
        if gallery.count == 0 {
            createArt("hello", productIdentifier: "", imageName: "", purchased: true)
            createArt("hello", productIdentifier: "", imageName: "", purchased: true)
            createArt("hello", productIdentifier: "", imageName: "", purchased: true)
            updateGallery()
            self.collectionView.reloadData()
        }
    }
    
    func createArt(title:String, productIdentifier: String, imageName: String, purchased: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        if let entity = NSEntityDescription.entityForName("Art", inManagedObjectContext: context) {
            let art = NSManagedObject(entity: entity, insertIntoManagedObjectContext: context) as! Art
            art.title = title
            art.productIdentifier = productIdentifier
            art.imageName = imageName
            art.purchased = NSNumber(bool: purchased)
        }
        
        do {
            try context.save()
        } catch {}
        
        
    }
    
    func updateGallery() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Art")
        do {
            let artPieces = try context.executeRequest(fetch)
            self.gallery = artPieces as! [Art]
        } catch {}
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("artCell", forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.size.width - 80, height: self.collectionView.bounds.size.height - 40)
    }


}

