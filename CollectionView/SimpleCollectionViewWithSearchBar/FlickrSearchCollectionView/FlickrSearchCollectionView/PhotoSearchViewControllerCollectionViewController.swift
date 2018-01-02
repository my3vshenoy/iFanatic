//
//  PhotoSearchViewControllerCollectionViewController.swift
//  FlickrSearchCollectionView
//
//  Created by User on 1/2/18.
//  Copyright © 2018 User. All rights reserved.
//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=70f9542794bdf372049738194b1564ee&text=dogs&format=json&nojsoncallback=1

import UIKit
//import Flickr copy
//import

final class PhotoSearchViewControllerCollectionViewController: UICollectionViewController {
    
    //MARK: Properties
    fileprivate let reuseIdentifier = "FCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 3
    
    //searches is an array that will keep track of all the searches made in the app
    fileprivate var searches = [FlickrSearchResults]()
    //Create object fir Flickr class and array for searches
    fileprivate let flickr = Flickr()
    
}

private extension PhotoSearchViewControllerCollectionViewController {
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
    }
}

extension PhotoSearchViewControllerCollectionViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        
        flickr.searchFlickrForTerm(textField.text!) {
            results, error in
            activityIndicator.removeFromSuperview()
            
            if let error = error {
                // Log errors
                print("Error searching : \(error)")
                return
            }
            
            if let results = results {
                //add results to searches array
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                // Reload data
                self.collectionView?.reloadData()
            }
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoSearchViewControllerCollectionViewController {
    //Number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    //Number of items in section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    
    //Data for cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let photo = photoForIndexPath(indexPath: indexPath)
        cell.backgroundColor = UIColor.white
        cell.flickrImgView.image = photo.thumbnail
        
        return cell
    }
}

extension PhotoSearchViewControllerCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

