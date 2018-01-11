//
//  AvatarPickerVC.swift
//  Shack
//
//  Created by My3 Shenoy on 09/01/18.
//  Copyright © 2018 com.aarven. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK:Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:Variables
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

    }

    //MARK: IBActions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlPressed(_ sender: Any) {
        
        if self.segmentControl.selectedSegmentIndex == 0{
            avatarType = .dark
        }
        else{
            avatarType = .light
        }
        collectionView.reloadData()
        
    }
    
    //MARK: Collection View Protocols
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCVCell{
            
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCVCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColumns:CGFloat = 3
        
        if UIScreen.main.bounds.width > 320{
            numberOfColumns = 4
        }
        
        let spaceBetweenCells:CGFloat = 10.0
        let padding: CGFloat = 40.0
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns-1) * spaceBetweenCells)/numberOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark{
            UserDataService.instance.setAvatarName(name: "dark\(indexPath.item)")
        }
        else{
            UserDataService.instance.setAvatarName(name: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
